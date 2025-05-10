; ----------------------------
; Plantillas para Smartphones
; ----------------------------
(deftemplate smartphone
   (slot marca)
   (slot modelo)
   (slot color)
   (slot precio)
   (slot stock))

; ----------------------------
; Plantillas para Computadoras
; ----------------------------
(deftemplate computador
   (slot marca)
   (slot modelo)
   (slot color)
   (slot precio)
   (slot stock)) 

; ----------------------------
; Plantillas para Accesorios
; ----------------------------
(deftemplate accesorio
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
   (slot tipo)  ; Ejemplo: menudista, mayorista
   (slot direccion)
   (slot telefono)
   (slot correo))

; ----------------------------
; Plantillas para Orden de Compra
; ----------------------------
(deftemplate orden
   (slot cliente) 
   (slot smartphone)  
   (slot computador)
   (slot accesorio)  
   (slot cantidad)  
   (slot metodo-pago)  
   (slot total)) 

; ----------------------------
; Plantillas para Tarjetas de Crédito
; ----------------------------
(deftemplate tarjeta_credito
   (slot banco)
   (slot grupo)  ; Ejemplo: Visa, MasterCard
   (slot expiracion)  
   (slot tipo))  ; Ejemplo: oro, plata

; ----------------------------
; Plantillas para Vales
; --
(deftemplate vale
   (slot valor)  
   (slot fecha-expiracion)  
   (slot aplicable-a)  
   (slot cliente)  
   (slot estatus))  
