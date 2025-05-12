; ----------------------------
; Hechos para Smartphones
; ----------------------------
(deffacts smartphones
    (smartphone (id-smartphone 1) (marca apple) (modelo iPhone16) (color rojo) (precio 27000) (stock 50))
    (smartphone (id-smartphone 2) (marca samsung) (modelo GalaxyS21) (color negro) (precio 22000) (stock 30))
)
; ----------------------------
; Hechos para Computadores
; ----------------------------
(deffacts computadores
    (compu (id-compu 1) (marca apple) (modelo macbookpro) (color gris) (precio 47000) (stock 20))
    (compu (id-compu 2) (marca dell) (modelo XPS13) (color plata) (precio 35000) (stock 10))
)

; ----------------------------
; Hechos para Accesorios
; ----------------------------
(deffacts accesorios
    (accesorio (id-accesorio 1) (tipo funda) (marca apple) (modelo iPhone16) (precio 500) (stock 100))
    (accesorio (id-accesorio 2) (tipo mica) (marca apple) (modelo iPhone16) (precio 200) (stock 150))
    (accesorio (id-accesorio 3) (tipo funda) (marca samsung) (modelo GalaxyS21) (precio 300) (stock 80))
    (accesorio (id-accesorio 4) (tipo mica) (marca samsung) (modelo GalaxyS21) (precio 400) (stock 60))
)

; ----------------------------
; Hechos para Clientes
; ----------------------------
(deffacts clientes
    (cliente (id-cliente 1) (nombre "Juan Pérez") (direccion "Calle Reforma 123") (telefono "3312345678") (correo "juanperez@gmail.com"))
    (cliente (id-cliente 2) (nombre "Ana Gómez") (direccion "Av. Juárez 456") (telefono "3322334455") (correo "ana.gomez@hotmail.com"))
    (cliente (id-cliente 3) (nombre "Luis Hernández") (direccion "Calle Hidalgo 789") (telefono "3333445566") (correo "luis.h@gmail.com"))
    (cliente (id-cliente 4) (nombre "Carla Ramírez") (direccion "Blvd. Vallarta 101") (telefono "3344556677") (correo "carla.r@gmail.com"))
    (cliente (id-cliente 5) (nombre "Pedro Torres") (direccion "Calle Morelos 202") (telefono "3355667788") (correo "ptorres@hotmail.com"))
)

; ----------------------------
; Hechos para Orden de Compra
; ----------------------------
(deffacts ordenes
    (orden (id-orden 1) (id-cliente 1) (tipo smartphone) (id-producto 1) (qty 1))
    (orden (id-orden 1) (id-cliente 1) (tipo compu) (id-producto 1) (qty 1))
    (orden (id-orden 2) (id-cliente 3) (tipo smartphone) (id-producto 2) (qty 1))
)

; ----------------------------
; Hechos para Lista de Orden de Compra
; ----------------------------
(deffacts lista-ordenes
    (lista-orden (id-lista-orden 1) (id-orden 1) (id-cliente 1) (metodo-pago efectivo) (plazos contado) (total 74000))
    (lista-orden (id-lista-orden 2) (id-orden 2) (id-cliente 3) (metodo-pago tarjeta-2) (plazos meses) (total 22000))
)

; ----------------------------
; Hechos para Tarjetas de Crédito
; ----------------------------
(deffacts tarjetas_credito
    (tarjeta_credito (id-tarjeta 1) (banco Banamex) (grupo Visa) (tipo oro))
    (tarjeta_credito (id-tarjeta 2) (banco Banamex) (grupo MasterCard) (tipo oro))
    (tarjeta_credito (id-tarjeta 3) (banco BBVA) (grupo Visa) (tipo oro))
    (tarjeta_credito (id-tarjeta 4) (banco BBVA) (grupo MasterCard) (tipo platino))
    (tarjeta_credito (id-tarjeta 5) (banco Santander) (grupo Visa) (tipo clásica))
    (tarjeta_credito (id-tarjeta 6) (banco Santander) (grupo MasterCard) (tipo plata))
    (tarjeta_credito (id-tarjeta 7) (banco Liverpool) (grupo Visa) (tipo clásica))
)

; ----------------------------
; Hechos para Vales
; ----------------------------
(deffacts vales
    (vale (id-vale 1) (valor 1000) (estatus activo))
)
