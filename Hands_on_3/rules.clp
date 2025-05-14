; Rule 1: Identifica clientes que no han realizado ninguna compra.

(defrule clientes-sin-compra
   ?c <- (cliente (id-cliente ?id) (nombre ?nombre))
   (not (orden (id-cliente ?id)))
   =>
   (printout t "El cliente " ?nombre " no ha realizado ninguna compra." crlf)
)

; Rule 2: Imprime los detalles de una orden.

(defrule imprimir-detalles-orden
   ?lista <- (lista-orden (id-lista-orden ?idlo) (id-orden ?ido) (id-cliente ?idc) (metodo-pago ?mp) (plazos ?pl) (total ?t))
   =>
   (printout t "========================================" crlf)
   (printout t "| Detalles de la Orden                 |" crlf)
   (printout t "========================================" crlf)
   (printout t "Orden #" ?ido " del cliente ID " ?idc crlf)
   (printout t "Método de pago: " ?mp crlf)
   (printout t "Plazos: " ?pl crlf)
   (printout t "Total: $" ?t crlf)
   (printout t "Productos comprados:" crlf)
   (do-for-all-facts ((?o orden)) 
       (eq ?o:id-orden ?ido)
       (bind ?tipo ?o:tipo)
       (bind ?id-prod ?o:id-producto)
       (bind ?qty ?o:qty)

       (if (eq ?tipo smartphone) then
           (do-for-fact ((?s smartphone)) (eq ?s:id-smartphone ?id-prod)
               (printout t " - Smartphone: " ?s:marca " " ?s:modelo " (" ?qty " unidades)" crlf)))

       (if (eq ?tipo compu) then
           (do-for-fact ((?c compu)) (eq ?c:id-compu ?id-prod)
               (printout t " - Computadora: " ?c:marca " " ?c:modelo " (" ?qty " unidades)" crlf)))

       (if (eq ?tipo accesorio) then
           (do-for-fact ((?a accesorio)) (eq ?a:id-accesorio ?id-prod)
               (printout t " - Accesorio: " ?a:tipo " para " ?a:marca " " ?a:modelo " (" ?qty " unidades)" crlf)))
   )
   (printout t "========================================" crlf)
)

; Rule 3: Verifica si hay suficiente stock para una orden.

(defrule verificar-stock-en-orden
   ?orden <- (orden (id-orden ?idOrden) (id-cliente ?idCliente) (tipo ?tipo) (id-producto ?idProducto) (qty ?qty))
   (lista-orden (id-orden ?idOrden))
   (or
      (and (test (eq ?tipo smartphone)) (smartphone (id-smartphone ?idProducto) (marca ?marca) (modelo ?modelo) (stock ?stock)))
      (and (test (eq ?tipo compu)) (compu (id-compu ?idProducto) (marca ?marca) (modelo ?modelo) (stock ?stock)))
      (and (test (eq ?tipo accesorio)) (accesorio (id-accesorio ?idProducto) (tipo ?subtipo) (marca ?marca) (modelo ?modelo) (stock ?stock)))
   )
   =>
   (if (>= ?stock ?qty) then
       (printout t "Hay stock suficiente para la orden " ?idOrden crlf)
       (printout t "   Producto: " ?tipo " " ?marca " " ?modelo crlf)
       (printout t "   Cantidad solicitada: " ?qty crlf)
       (printout t "   En stock: " ?stock crlf)
   else
       (printout t "NO hay stock suficiente para la orden " ?idOrden crlf)
       (printout t "   Producto: " ?tipo " " ?marca " " ?modelo crlf)
       (printout t "   Cantidad solicitada: " ?qty crlf)
       (printout t "   En stock: " ?stock crlf))
)

; Rule 4: Imprime el stock restante de un smartphone después de una orden.

(defrule imprimir-stock-smartphone
   (orden (id-orden ?idOrden) (tipo smartphone) (id-producto ?idProducto) (qty ?qty))
   (lista-orden (id-orden ?idOrden))
   (smartphone (id-smartphone ?idProducto) (marca ?marca) (modelo ?modelo) (stock ?stock))
   =>
   (bind ?restante (- ?stock ?qty))
   (printout t "Orden " ?idOrden ": Stock restante de smartphone " ?marca " " ?modelo " = " ?restante crlf)
)

; Rule 5: Imprime el stock restante de una computadora después de una orden.

(defrule imprimir-stock-compu
   (orden (id-orden ?idOrden) (tipo compu) (id-producto ?idProducto) (qty ?qty))
   (lista-orden (id-orden ?idOrden))
   (compu (id-compu ?idProducto) (marca ?marca) (modelo ?modelo) (stock ?stock))
   =>
   (bind ?restante (- ?stock ?qty))
   (printout t "Orden " ?idOrden ": Stock restante de computadora " ?marca " " ?modelo " = " ?restante crlf)
)

; Rule 6: Imprime el stock restante de un accesorio después de una orden.

(defrule imprimir-stock-accesorio
   (orden (id-orden ?idOrden) (tipo accesorio) (id-producto ?idProducto) (qty ?qty))
   (lista-orden (id-orden ?idOrden))
   (accesorio (id-accesorio ?idProducto) (tipo ?tipo) (marca ?marca) (modelo ?modelo) (stock ?stock))
   =>
   (bind ?restante (- ?stock ?qty))
   (printout t "Orden " ?idOrden ": Stock restante de accesorio " ?tipo " " ?marca " " ?modelo " = " ?restante crlf)
)

; Rule 7: Clasifica al cliente como MENUDISTA o MAYORISTA según la cantidad de productos comprados.

(defrule clasificar-cliente-por-cantidad
   ?orden <- (orden (id-orden ?idorden) (id-cliente ?idcliente) (qty ?qty))
   ?cliente <- (cliente (id-cliente ?idcliente) (nombre ?nombre))
   =>
   (if (< ?qty 10) then
      (printout t "El cliente " ?nombre " es MENUDISTA." crlf)
   else
      (printout t "El cliente " ?nombre " es MAYORISTA." crlf)
   )
)

; Rule 8: Aplica una promoción del 10% de descuento si se paga con tarjeta BBVA Visa.

(defrule promo-bbva-visa
    (lista-orden (id-orden ?idorden) (metodo-pago tarjeta-?idtarjeta) (total ?total))
    (tarjeta_credito (id-tarjeta ?idtarjeta) (banco BBVA) (grupo Visa))
    =>
    (bind ?nuevo-total (* ?total 0.9))
    (printout t "Promo BBVA-Visa aplicada: 10% de descuento. Nuevo total: $" ?nuevo-total crlf)
)

; Rule 9: Aplica un descuento de $500 en compras mayores a $50,000 si se paga en efectivo.

(defrule promo-efectivo-mayor-50000
    (lista-orden (id-orden ?idorden) (metodo-pago efectivo) (total ?total&:(> ?total 50000)))
    =>
    (bind ?nuevo-total (- ?total 500))
    (printout t "Promo Efectivo: -$500 por compra > $50,000. Nuevo total: $" ?nuevo-total crlf)
)

; Rule 10: Aplica un 5% de descuento en compras realizadas con tarjeta Liverpool.

(defrule promo-liverpool
    (lista-orden (id-orden ?idorden) (metodo-pago tarjeta-?idtarjeta) (total ?total))
    (tarjeta_credito (id-tarjeta ?idtarjeta) (banco Liverpool))
    =>
    (bind ?nuevo-total (* ?total 0.95))
    (printout t "Promo Liverpool: 5% de descuento aplicado. Nuevo total: $" ?nuevo-total crlf)
)

; Rule 11: Aplica un descuento con un vale si la compra es mayor a $10,000.

(defrule promo-vale
    (lista-orden (id-orden ?idorden) (total ?total&:(> ?total 10000)))
    (vale (id-vale ?idvale) (valor ?valor) (estatus activo))
    =>
    (bind ?nuevo-total (- ?total ?valor))
    (printout t "Promo Vale: Vale de $" ?valor " aplicado. Nuevo total: $" ?nuevo-total crlf)
)

; Rule 12: Recomienda usar tarjeta Visa para descuentos exclusivos en compras de smartphones Apple.

(defrule recomendar-tarjeta-de-credito
   ?orden <- (orden (id-orden ?idorden) (id-cliente ?idcliente) (tipo smartphone) (id-producto ?idproducto) (qty ?qty))
   ?cliente <- (cliente (id-cliente ?idcliente) (nombre ?nombre))
   ?tarjeta_credito <- (tarjeta_credito (id-tarjeta ?idtarjeta) (banco ?banco) (grupo ?grupo) (tipo oro))
   =>
   (if (eq ?grupo "Visa") then
      (printout t "Recomendación para " ?nombre ": ¡Usa tu tarjeta Visa para obtener descuentos exclusivos en tu próxima compra!" crlf)
   )
)

; Rule 13: Recomienda otros productos según la marca del smartphone adquirido.

(defrule recomendar-productos-segun-marca
   ?orden <- (orden (id-orden ?idorden) (id-cliente ?idcliente) (tipo smartphone) (id-producto ?idproducto) (qty ?qty))
   ?smartphone <- (smartphone (id-smartphone ?idproducto) (marca ?marca))
   ?cliente <- (cliente (id-cliente ?idcliente) (nombre ?nombre))
   =>
   (printout t "Orden ID: " ?idorden " - Producto ID: " ?idproducto " - Marca: " ?marca crlf)

   (if (eq ?marca apple) then
      (printout t "Recomendación para " ?nombre ": Te sugerimos probar más productos de Apple, como el MacBook Pro o accesorios adicionales." crlf)
   else 
      (if (eq ?marca samsung) then
         (printout t "Recomendación para " ?nombre ": No olvides explorar otros productos Samsung que se complementan con tu Galaxy S21." crlf)
      )
   )
)

; Rule 14: Recomienda accesorios para smartphones según la marca adquirida.

(defrule recomendar-accesorios-smartphone
   ?orden <- (orden (id-orden ?idorden) (id-cliente ?idcliente) (tipo smartphone) (id-producto ?idproducto) (qty ?qty))
   ?smartphone <- (smartphone (id-smartphone ?idproducto) (marca ?marca))
   ?cliente <- (cliente (id-cliente ?idcliente) (nombre ?nombre))
   =>
   (if (eq ?marca apple) then
      (printout t "Recomendación para " ?nombre ": No te olvides de los accesorios para tu iPhone. Ofrecemos fundas y micas Apple." crlf)
   else if (eq ?marca samsung) then
      (printout t "Recomendación para " ?nombre ": Mira nuestras fundas y micas Samsung para tu Galaxy S21." crlf)
   )
)

; Rule 15: Descuento para mayoristas smartphones

(defrule descuento-mayoristas
    ?orden <- (orden (id-orden ?idOrden) (id-cliente ?idCliente) (tipo ?tipo) (id-producto ?idProducto) (qty ?qty))
    ?cliente <- (cliente (id-cliente ?idCliente) (nombre ?nombre))
    
    ; Para smartphones
    (smartphone (id-smartphone ?idProducto) (precio ?precio) (stock ?stock))
    
    =>
    (if (> ?qty 10) then
        (bind ?descuento (* ?precio 0.1)) 
        (bind ?precio-final (- ?precio ?descuento))
        (printout t "El cliente " ?nombre " es mayorista. Se aplica un descuento del 10%." crlf)
        (printout t "Precio original: " ?precio crlf)
        (printout t "Descuento: " ?descuento crlf)
        (printout t "Nuevo precio con descuento: " ?precio-final crlf)
    )
)

; Rule 16: Descuento para mayoristas computadores

(defrule descuento-mayoristas-compu
    ?orden <- (orden (id-orden ?idOrden) (id-cliente ?idCliente) (tipo ?tipo) (id-producto ?idProducto) (qty ?qty))
    ?cliente <- (cliente (id-cliente ?idCliente) (nombre ?nombre))
    (compu (id-compu ?idProducto) (precio ?precio) (stock ?stock))
    =>
    (if (> ?qty 10) then
        (bind ?descuento (* ?precio 0.1))  
        (bind ?precio-final (- ?precio ?descuento))  
        (printout t "El cliente " ?nombre " es mayorista. Se aplica un descuento del 10%." crlf)
        (printout t "Precio original: " ?precio crlf)
        (printout t "Descuento: " ?descuento crlf)
        (printout t "Nuevo precio con descuento: " ?precio-final crlf)
    )
)

; Rule 17: Descuento para mayoristas accesorios

(defrule descuento-mayoristas-accesorios
    ?orden <- (orden (id-orden ?idOrden) (id-cliente ?idCliente) (tipo ?tipo) (id-producto ?idProducto) (qty ?qty))
    ?cliente <- (cliente (id-cliente ?idCliente) (nombre ?nombre))
    (accesorio (id-accesorio ?idProducto) (precio ?precio) (stock ?stock))
    =>
    (if (> ?qty 10) then
        (bind ?descuento (* ?precio 0.1)) 
        (bind ?precio-final (- ?precio ?descuento))
        (printout t "El cliente " ?nombre " es mayorista. Se aplica un descuento del 10%." crlf)
        (printout t "Precio original: " ?precio crlf)
        (printout t "Descuento: " ?descuento crlf)
        (printout t "Nuevo precio con descuento: " ?precio-final crlf)
    )
)

; Rule 18: Oferta de 24 meses sin intereses en iPhone 16 con tarjeta Banamex

(defrule oferta-24-meses-sin-intereses
    ?orden <- (orden (id-orden ?idOrden) (id-cliente ?idCliente) (tipo smartphone) (id-producto 1) (qty ?qty))
    ?producto <- (smartphone (id-smartphone 1) (marca apple) (modelo iPhone16) (precio ?precio) (stock ?stock))
    ?lista-orden <- (lista-orden (id-lista-orden ?idLista) (id-orden ?idOrden) (metodo-pago tarjeta-credito) (total ?total))
    ?tarjeta <- (tarjeta_credito (id-tarjeta ?idTarjeta) (banco Banamex))
    =>
    (bind ?plazo 24)  ; Ofrecemos 24 meses sin intereses
    (printout t "Compra de iPhone 16 con tarjeta Banamex." crlf)
    (printout t "Plazo de pago: " ?plazo " meses sin intereses." crlf)
    (printout t "Total a pagar: " ?total crlf)
)

; Rule 19: Oferta de 12 meses sin intereses en Samsung Galaxy Note 21 con tarjeta Liverpool VISA

(defrule oferta-12-meses-no-intereses
    ?orden <- (orden (id-orden ?idOrden) (id-cliente ?idCliente) (tipo smartphone) (id-producto 2) (qty ?qty))
    ?producto <- (smartphone (id-smartphone 2) (marca samsung) (modelo GalaxyS21) (precio ?precio) (stock ?stock))
    ?lista-orden <- (lista-orden (id-lista-orden ?idLista) (id-orden ?idOrden) (metodo-pago tarjeta-credito) (total ?total))
    ?tarjeta <- (tarjeta_credito (id-tarjeta ?idTarjeta) (banco Liverpool) (grupo Visa))
    =>
    (bind ?plazo 12)  ; Ofrecemos 12 meses sin intereses
    (printout t "Compra de Samsung Galaxy Note 21 con tarjeta Liverpool VISA." crlf)
    (printout t "Plazo de pago: " ?plazo " meses sin intereses." crlf)
    (printout t "Total a pagar: " ?total crlf)
)

; Rule 20: Oferta de vales en la compra de MacBook Air e iPhone 16 al contado

(defrule oferta-vales-macbook-iphone
    ?orden-smartphone <- (orden (id-orden ?idOrden) (id-cliente ?idCliente) (tipo smartphone) (id-producto 1) (qty ?qty-smartphone))
    ?orden-computadora <- (orden (id-orden ?idOrden) (id-cliente ?idCliente) (tipo compu) (id-producto 1) (qty ?qty-computadora))
    ?lista-orden <- (lista-orden (id-lista-orden ?idLista) (id-orden ?idOrden) (id-cliente ?idCliente) (metodo-pago efectivo) (plazos contado) (total ?total))
    =>
    (bind ?total-vales (* (/ ?total 1000) 100))  ; Por cada 1000 pesos de compra, 100 pesos en vales
    (printout t "Compra MacBook Air y iPhone16 al contado." crlf)
    (printout t "¡Te ofrecemos " ?total-vales " pesos en vales por cada 1000 pesos de compra!" crlf)
    (assert (vale (id-vale ?idOrden) (valor ?total-vales) (estatus activo))) 
)

; Rule 21: Descuento en accesorios con la compra de un smartphone

(defrule oferta-descuento-accesorios
   ?orden-smartphone <- (orden (id-orden ?idOrden) (id-cliente ?idCliente) (tipo smartphone) (id-producto ?idProducto) (qty ?qty))
   (smartphone (id-smartphone ?idProducto) (modelo ?modelo-smartphone))
   (accesorio (id-accesorio ?idAcc) (tipo ?tipo) (modelo ?modelo-smartphone) (precio ?precio) (stock ?stock))
   =>
   (if (eq ?tipo "funda") then
       (bind ?descuento (* ?precio 0.15))  ; Aplica un descuento del 15% en fundas
       (bind ?precio-final (- ?precio ?descuento))  ; Calcula el precio final de la funda
       (printout t "Compra un Smartphone y obtén un descuento del 15% en accesorios." crlf)
       (printout t "Precio de funda con descuento: " ?precio-final crlf)
   )
   (if (eq ?tipo "mica") then
       (bind ?descuento (* ?precio 0.15))  ; Aplica un descuento del 15% en micas
       (bind ?precio-final (- ?precio ?descuento))  ; Calcula el precio final de la mica
       (printout t "Precio de mica con descuento: " ?precio-final crlf)  ; Imprime el precio final de la mica
   )
)



