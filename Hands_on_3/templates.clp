; ----------------------------
; Plantillas para Smartphones
; ----------------------------
(deftemplate smartphone
   (slot id-smartphone)
   (slot marca)
   (slot modelo)
   (slot color)
   (slot precio)
   (slot stock))

; ----------------------------
; Plantillas para Computadoras
; ----------------------------
(deftemplate compu
   (slot id-compu)
   (slot marca)
   (slot modelo)
   (slot color)
   (slot precio)
   (slot stock)) 

; ----------------------------
; Plantillas para Accesorios
; ----------------------------
(deftemplate accesorio
   (slot id-accesorio)
   (slot tipo) 
   (slot marca)
   (slot modelo)
   (slot precio)
   (slot stock)) 

; ----------------------------
; Plantillas para Clientes
; ----------------------------
(deftemplate cliente
   (slot id-cliente)
   (slot nombre)
   (slot direccion)
   (slot telefono)
   (slot correo))

; ----------------------------
; Plantillas para Orden de Compra
; ----------------------------
(deftemplate orden
   (slot id-orden)
   (slot id-cliente)
   (slot id-producto)
   (slot tipo)
   (slot qty)  
) 

; ----------------------------
; Plantillas para Lista de Orden de Compra
; ----------------------------
(deftemplate lista-orden
   (slot id-lista-orden)
   (slot id-orden)
   (slot id-cliente)
   (slot metodo-pago)  
   (slot plazos)
   (slot total)) 

; ----------------------------
; Plantillas para Tarjetas de Crédito
; ----------------------------
(deftemplate tarjeta_credito
   (slot id-tarjeta)
   (slot banco)
   (slot grupo)  ; Ejemplo: Visa, MasterCard 
   (slot tipo))  ; Ejemplo: oro, plata

; ----------------------------
; Plantillas para Vales
; --
(deftemplate vale
   (slot id-vale)
   (slot valor)    
   (slot estatus))  
