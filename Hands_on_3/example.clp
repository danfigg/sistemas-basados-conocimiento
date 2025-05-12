; Regla 2: Validar que exista stock suficiente para los productos
(defrule stock-insuficiente
   (orden (smartphone ?msmart) (computador ?mcompu) (accesorio ?maccesorio) 
          (qty-smartphone ?qs) (qty-computador ?qc) (qty-accesorio ?qa) 
           (procesada no))

   (smartphone (modelo ?msmart) (stock ?csmart))
   (computador (modelo ?mcompu) (stock ?ccompu))
   (accesorio (modelo ?maccesorio) (stock ?cacc))
   
   (test (or 
            (and (neq ?msmart none) (< ?csmart ?qs))
            (and (neq ?mcompu none) (< ?ccompu ?qc))
            (and (neq ?maccesorio none) (< ?cacc ?qa))
        ))
   =>
   (if (and (neq ?msmart none) (< ?csmart ?qs)) then
      (printout t "Error: Stock insuficiente para smartphone " ?msmart 
                ". Solicitado: " ?qs ", disponible: " ?csmart crlf))
   (if (and (neq ?mcompu none) (< ?ccompu ?qc)) then
      (printout t "Error: Stock insuficiente para computador " ?mcompu 
                ". Solicitado: " ?qc ", disponible: " ?ccompu crlf))
   (if (and (neq ?maccesorio none) (< ?cacc ?qa)) then
      (printout t "Error: Stock insuficiente para accesorio " ?maccesorio 
                ". Solicitado: " ?qa ", disponible: " ?cacc crlf))
)

; Regla 4: Canjear vale y rebajar al total
; **** Que solo se active si tiene ese estatus y cambiar a canjeado *****
(defrule relacionar-vale
   ?orden <- (orden (cliente ?id) (metodo-pago vale) (total ?total))
   ?v <- (vale (cliente ?id) (valor ?valor) (fecha-expiracion ?fe) (estatus ?estatus))
   (test (eq ?estatus activo))
   =>
   (bind ?nuevo-total (- ?total ?valor))
   (printout t "Vale usado por cliente " ?id ": $" ?valor ", vence el " ?fe ", estatus: " ?estatus crlf)
   (printout t "Total original: $" ?total ", total con vale aplicado: $" ?nuevo-total crlf)
)


; Regla 5: Aplica promoción si se compra un iPhone16 con tarjeta Banamex
(defrule promo-iphone16-banamex
   (orden 
      (smartphone iPhone16) 
      (metodo-pago ?id-tarjeta)
   )
   (tarjeta_credito 
      (id-tarjeta ?id-tarjeta) 
      (banco Banamex)
   )
   =>
   (printout t "¡Promoción activada! iPhone16 con tarjeta Banamex: 24 meses sin intereses." crlf)
)

; Regla 3: Aplica promoción si se compra una MacBookAir y un iPhone16 al contado, ofrecer 100 pesos en vales por cada 1000 pesos de compra:
(defrule promo-combo-macbookair-iphone16
   (orden 
      (smartphone iPhone16)
      (computador MacBookAir)
      (plazos contado)
      (total ?t)
   )
   =>
   (bind ?vales (* (div ?t 1000) 100))
   (printout t "¡Combo aplicado! Recibes $" ?vales " pesos en vales por tu compra." crlf)
)

; Regla 6: Aplica promoción si se compra un Samsung Note21 con tarjeta Liverpool VISA
(defrule promo-note21-liverpool
   (orden 
      (smartphone GalaxyS21) 
      (metodo-pago ?id-tarjeta)
   )
   (tarjeta_credito 
      (id-tarjeta ?id-tarjeta) 
      (banco Liverpool)
      (grupo Visa)
   )
   =>
   (printout t "¡Promoción activada! Samsung Note21 con tarjeta Liverpool VISA: 12 meses sin intereses." crlf)
)

; Regla 7: Anunciar la promoción al comprar un smartphone
(defrule promo-accesorios-smartphone
   (orden 
      (smartphone ?s&~none)
   )
   =>
   (printout t "¡Promoción! Al comprar un smartphone, los accesorios tienen 15% de descuento." crlf)
)

; Regla 8: Aplicar la promo de accesorio, actualizar el nuevo precio del accesorio con descuento
(defrule aplicar-promo-smartphone
   ?o <- (orden (smartphone ?s))
   ?a <- (accesorio (tipo ?tipo) (modelo ?modelo) (precio ?precio))
   (test (eq ?s ?modelo)) 
   =>
   (bind ?descuento (* ?precio 0.15))
   (bind ?nuevo-precio (- ?precio ?descuento))
   (printout t "¡Promoción de 15% a accesorio aplicada!" crlf)
   (printout t ?tipo " de " ?modelo " de $" ?precio " a $" ?nuevo-precio crlf)
)

; Regla 9: Clasificar clientes menudistas
(defrule clasificar-menudista
   ?orden <- (orden (cliente ?id) (qty-total ?q&:(< ?q 10)))
   ?c <- (cliente (id-cliente ?id) (nombre ?nombre))
   =>
   (printout t "" ?nombre " clasificado como MENUDISTA por comprar menos de 10 unidades." crlf)
)

; Regla 10: Clasificar clientes mayoristas
(defrule clasificar-mayorista
   ?orden <- (orden (cliente ?id) (qty-total ?q&:(>= ?q 10)) )
   ?c <- (cliente (id-cliente ?id) (nombre ?nombre))
   =>
   (printout t "" ?nombre "  clasificado como MAYORISTA por comprar 10 o más unidades." crlf)
)


; Regla 3: Actualizar el stock de los productos
(defrule actualizar-stock
   (orden (smartphone ?msmart) (computador ?mcompu) (accesorio ?maccesorio)
          (qty-smartphone ?qs) (qty-computador ?qc) (qty-accesorio ?qa))
   =>
   ;; Actualizar smartphone
   (if (neq ?msmart none) then
      (do-for-fact ((?f smartphone)) (eq ?msmart ?f:modelo)
         (if (>= ?f:stock ?qs) then
            (retract ?f)
            (assert (smartphone (modelo ?f:modelo) (stock (- ?f:stock ?qs))))
            (printout t "Stock actualizado - Smartphone " ?f:modelo ": -" ?qs crlf)
         )
      )
   )

   ;; Actualizar computador
   (if (neq ?mcompu none) then
      (do-for-fact ((?f computador)) (eq ?mcompu ?f:modelo)
         (if (>= ?f:stock ?qc) then
            (retract ?f)
            (assert (computador (modelo ?f:modelo) (stock (- ?f:stock ?qc))))
            (printout t "Stock actualizado - Computador " ?f:modelo ": -" ?qc crlf)
         )
      )
   )

   ;; Actualizar accesorio
   (if (neq ?maccesorio none) then
      (do-for-fact ((?f accesorio)) (eq ?maccesorio ?f:modelo)
         (if (>= ?f:stock ?qa) then
            (retract ?f)
            (assert (accesorio (modelo ?f:modelo) (stock (- ?f:stock ?qa))))
            (printout t "Stock actualizado - Accesorio " ?f:modelo ": -" ?qa crlf)
         )
      )
   )
)

; Regla 3: Aplica promoción si se compra una MacBookAir y un iPhone16 al contado
(defrule promo-combo-macbookair-iphone16
   (orden 
      (smartphone ?smart)
      (computador ?comp)
      (plazos contado)
      (total ?t)
   )
   (smartphone (marca apple) (modelo iPhone16))
   (computador (marca apple) (modelo MacBookAir))
   =>
   (bind ?vales (* (div ?t 1000) 100))
   (printout t "¡Combo aplicado! Recibes $" ?vales " pesos en vales por tu compra." crlf)
)

; Regla 6: Descuento para tipos de cliente
(defrule descuento-mayorista
   (orden (smartphone (modelo ?m)) (qty ?q&:(>= ?q 10)) (total ?t))
   =>
   (bind ?descuento (* ?t 0.10)) ; 10% de descuento
   (printout t "Descuento aplicado por MAYORISTA: $" ?descuento crlf)
)

(defrule descuento-menudista
   (orden (smartphone (modelo ?m)) (qty ?q&:(< ?q 10)) (total ?t))
   =>
   (bind ?descuento (* ?t 0.05)) ; 5% de descuento
   (printout t "Descuento aplicado por MENUDISTA: $" ?descuento crlf)
)

(defrule recomendacion-smartphone
   (orden (smartphone ?m))
   =>
   (printout t "Recomendación: Te sugerimos agregar una mica y funda para tu smartphone con 15% de descuento." crlf)
)

; Regla 8: Actualizar stock de smartphones
(defrule actualizar-stock-smartphone
   (orden (smartphone (modelo ?m)) (qty ?q))
   (stock (modelo ?m) (cantidad ?s))
   =>
   (bind ?nuevo (- ?s ?q))
   (retract (stock (modelo ?m) (cantidad ?s)))
   (assert (stock (modelo ?m) (cantidad ?nuevo)))
   (printout t "Stock actualizado del SMARTPHONE modelo " ?m ": ahora hay " ?nuevo " unidades." crlf)
)

; Regla 9: Actualizar stock de computadores
(defrule actualizar-stock-computador
   (orden (computador (modelo ?m)) (qty ?q))
   (stock (modelo ?m) (cantidad ?s))
   =>
   (bind ?nuevo (- ?s ?q))
   (retract (stock (modelo ?m) (cantidad ?s)))
   (assert (stock (modelo ?m) (cantidad ?nuevo)))
   (printout t "Stock actualizado del COMPUTADOR modelo " ?m ": ahora hay " ?nuevo " unidades." crlf)
)

; Regla 10: Actualizar stock de accesorios
(defrule actualizar-stock-accesorio
   (orden (accesorio (modelo ?m)) (qty ?q))
   (stock (modelo ?m) (cantidad ?s))
   =>
   (bind ?nuevo (- ?s ?q))
   (retract (stock (modelo ?m) (cantidad ?s)))
   (assert (stock (modelo ?m) (cantidad ?nuevo)))
   (printout t "Stock actualizado del ACCESORIO modelo " ?m ": ahora hay " ?nuevo " unidades." crlf)
)

; Regla 11: Validar stock de smartphone
(defrule validar-stock-smartphone
  ?orden <- (orden (smartphone ?modelo) (qty ?qty) (total ?total))
  ?prod <- (smartphone (modelo ?modelo) (stock ?stock&:(>= ?stock ?qty)))
  =>
  (printout t "Orden válida para el smartphone " ?modelo crlf)
)

; Regla 12: Validar stock de computador
(defrule validar-stock-computador
  ?orden <- (orden (computador ?modelo) (qty ?qty) (total ?total))
  ?prod <- (computador (modelo ?modelo) (stock ?stock&:(>= ?stock ?qty)))
  =>
  (printout t "Orden válida para el computador " ?modelo crlf)
)

; Regla 13: Validar stock de accesorio
(defrule validar-stock-accesorio
  ?orden <- (orden (accesorio ?modelo) (qty ?qty) (total ?total))
  ?prod <- (accesorio (modelo ?modelo) (stock ?stock&:(>= ?stock ?qty)))
  =>
  (printout t "Orden válida para el accesorio " ?modelo crlf)
)

(defrule relacionar-tarjeta
   ?orden <- (orden (cliente ?id) (metodo-pago ?metodo&:(str-index "tarjeta-" ?metodo)))
   ?banco <- (str-parse ?metodo "-" 1)
   ?tipo  <- (str-parse ?metodo "-" 2)
   ?t <- (tarjeta_credito (banco ?banco) (tipo ?tipo) (grupo ?grupo) (expiracion ?exp))
   =>
   (printout t "Cliente " ?id " pagó con tarjeta " ?tipo " del banco " ?banco " (" ?grupo "), expira en " ?exp crlf))