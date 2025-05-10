; ----------------------------
; Hechos para Smartphones
; ----------------------------
(assert (smartphone (marca apple) (modelo iPhone16) (color rojo) (precio 27000) (stock 50)))
(assert (smartphone (marca samsung) (modelo GalaxyS21) (color negro) (precio 22000) (stock 30)))
(assert (smartphone (marca motorola) (modelo MotoG100) (color azul) (precio 15000) (stock 15)))
(assert (smartphone (marca xiaomi) (modelo RedmiNote11) (color plata) (precio 10000) (stock 40)))
(assert (smartphone (marca huawei) (modelo P40Pro) (color dorado) (precio 18000) (stock 20)))
(assert (smartphone (marca nokia) (modelo XR20) (color gris) (precio 12000) (stock 25)))
(assert (smartphone (marca oppo) (modelo Reno6) (color negro) (precio 16000) (stock 35)))
(assert (smartphone (marca realme) (modelo GTNeo2) (color verde) (precio 14000) (stock 22)))
(assert (smartphone (marca vivo) (modelo V21) (color rosa) (precio 17000) (stock 28)))
(assert (smartphone (marca oneplus) (modelo 9Pro) (color azul) (precio 29000) (stock 18)))
(assert (smartphone (marca sony) (modelo Xperia5) (color negro) (precio 25000) (stock 20)))
(assert (smartphone (marca lg) (modelo Velvet) (color blanco) (precio 13000) (stock 10)))
(assert (smartphone (marca zte) (modelo Axon30) (color gris) (precio 11000) (stock 12)))
(assert (smartphone (marca infinix) (modelo ZeroX) (color dorado) (precio 9500) (stock 14)))
(assert (smartphone (marca honor) (modelo Magic3) (color azul) (precio 20000) (stock 16)))

; ----------------------------
; Hechos para Computadores
; ----------------------------
(assert (computador (marca apple) (modelo macbookpro) (color gris) (precio 47000) (stock 20)))
(assert (computador (marca dell) (modelo XPS13) (color plata) (precio 35000) (stock 10)))
(assert (computador (marca hp) (modelo Pavilion) (color negro) (precio 25000) (stock 25)))
(assert (computador (marca lenovo) (modelo ThinkPad) (color negro) (precio 30000) (stock 18)))
(assert (computador (marca acer) (modelo Aspire5) (color azul) (precio 22000) (stock 12)))
(assert (computador (marca asus) (modelo ZenBook) (color gris) (precio 28000) (stock 14)))
(assert (computador (marca msi) (modelo GF63) (color negro) (precio 26000) (stock 8)))
(assert (computador (marca samsung) (modelo GalaxyBook) (color blanco) (precio 24000) (stock 9)))
(assert (computador (marca lg) (modelo Gram17) (color plata) (precio 32000) (stock 11)))
(assert (computador (marca huawei) (modelo MateBook) (color gris) (precio 23000) (stock 13)))
(assert (computador (marca razer) (modelo Blade15) (color negro) (precio 50000) (stock 7)))
(assert (computador (marca microsoft) (modelo SurfacePro7) (color plata) (precio 40000) (stock 6)))
(assert (computador (marca chuwi) (modelo HeroBook) (color azul) (precio 15000) (stock 15)))
(assert (computador (marca gigabyte) (modelo Aero15) (color negro) (precio 42000) (stock 5)))
(assert (computador (marca xiaomi) (modelo MiNotebook) (color gris) (precio 27000) (stock 10)))

; ----------------------------
; Hechos para Accesorios
; ----------------------------
(assert (accesorio (tipo funda) (marca apple) (modelo iPhone16) (precio 500) (stock 100)))
(assert (accesorio (tipo mica) (marca apple) (modelo iPhone16) (precio 200) (stock 150)))
(assert (accesorio (tipo mouse) (marca logitech) (modelo M220) (precio 300) (stock 80)))
(assert (accesorio (tipo teclado) (marca hp) (modelo KM100) (precio 400) (stock 60)))
(assert (accesorio (tipo cargador) (marca samsung) (modelo FastCharge) (precio 600) (stock 90)))
(assert (accesorio (tipo audifonos) (marca sony) (modelo WH1000XM4) (precio 4500) (stock 50)))
(assert (accesorio (tipo case) (marca xiaomi) (modelo RedmiNote11) (precio 250) (stock 120)))
(assert (accesorio (tipo base) (marca lenovo) (modelo Dock1) (precio 800) (stock 30)))
(assert (accesorio (tipo microSD) (marca sandisk) (modelo Ultra64GB) (precio 350) (stock 70)))
(assert (accesorio (tipo stylus) (marca apple) (modelo Pencil2) (precio 2000) (stock 25)))
(assert (accesorio (tipo pad) (marca razer) (modelo Goliathus) (precio 600) (stock 40)))
(assert (accesorio (tipo hub) (marca orico) (modelo USB3.0) (precio 700) (stock 35)))
(assert (accesorio (tipo adaptador) (marca belkin) (modelo HDMI2) (precio 500) (stock 45)))
(assert (accesorio (tipo tripie) (marca ugreen) (modelo ProStand) (precio 300) (stock 55)))
(assert (accesorio (tipo ventilador) (marca coolermaster) (modelo ChillPad) (precio 850) (stock 20)))

; ----------------------------
; Hechos para Clientes
; ----------------------------
(assert (cliente (id-cliente C001) (nombre Juan Pérez) (tipo menudista) (direccion "Calle Reforma 123") (telefono "3312345678") (correo "juanperez@gmail.com")))
(assert (cliente (id-cliente C002) (nombre Ana Gómez) (tipo mayorista) (direccion "Av. Juárez 456") (telefono "3322334455") (correo "ana.gomez@hotmail.com")))
(assert (cliente (id-cliente C003) (nombre Luis Hernández) (tipo menudista) (direccion "Calle Hidalgo 789") (telefono "3333445566") (correo "luis.h@gmail.com")))
(assert (cliente (id-cliente C004) (nombre Carla Ramírez) (tipo menudista) (direccion "Blvd. Vallarta 101") (telefono "3344556677") (correo "carla.r@correo.com")))
(assert (cliente (id-cliente C005) (nombre Pedro Torres) (tipo mayorista) (direccion "Calle Morelos 202") (telefono "3355667788") (correo "ptorres@empresa.com")))
(assert (cliente (id-cliente C006) (nombre Sofía López) (tipo menudista) (direccion "Av. Patria 303") (telefono "3366778899") (correo "sofial@hotmail.com")))
(assert (cliente (id-cliente C007) (nombre Mario Castillo) (tipo mayorista) (direccion "Calle Independencia 404") (telefono "3377889900") (correo "mcastillo@negocio.com")))
(assert (cliente (id-cliente C008) (nombre Laura Díaz) (tipo menudista) (direccion "Calle Colón 505") (telefono "3388990011") (correo "laura.d@gmail.com")))
(assert (cliente (id-cliente C009) (nombre Hugo Medina) (tipo mayorista) (direccion "Av. México 606") (telefono "3399001122") (correo "hugom@provedor.com")))
(assert (cliente (id-cliente C010) (nombre Alejandra Cruz) (tipo menudista) (direccion "Calle América 707") (telefono "3300112233") (correo "ale.cruz@hotmail.com")))
(assert (cliente (id-cliente C011) (nombre Jorge Salas) (tipo mayorista) (direccion "Av. Revolución 808") (telefono "3311223344") (correo "jorge.s@empresa.com")))
(assert (cliente (id-cliente C012) (nombre Brenda Ríos) (tipo menudista) (direccion "Calle Juan Pablo II 909") (telefono "3322334455") (correo "brios@gmail.com")))
(assert (cliente (id-cliente C013) (nombre Roberto Chávez) (tipo mayorista) (direccion "Av. Inglaterra 1010") (telefono "3333445566") (correo "rchavez@mayoreo.com")))
(assert (cliente (id-cliente C014) (nombre Mariana Flores) (tipo menudista) (direccion "Calle López Mateos 1111") (telefono "3344556677") (correo "marianaf@correo.com")))
(assert (cliente (id-cliente C015) (nombre Sergio Aguilar) (tipo mayorista) (direccion "Calle Niños Héroes 1212") (telefono "3355667788") (correo "sergioa@negocio.com")))

; ----------------------------
; Hechos para Orden de Compra
; ----------------------------
(assert (orden (cliente C001) (smartphone iPhone16) (computador none) (accesorio none) (qty 1) (metodo-pago tarjeta) (total 27000)))
(assert (orden (cliente C002) (smartphone GalaxyS21) (computador XPS13) (accesorio none) (qty 2) (metodo-pago vale) (total 98700)))
(assert (orden (cliente C003) (smartphone none) (computador Pavilion) (accesorio M220) (qty 1) (metodo-pago tarjeta) (total 18500)))
(assert (orden (cliente C004) (smartphone RedmiNote11) (computador none) (accesorio HDMI2) (qty 1) (metodo-pago efectivo) (total 14700)))
(assert (orden (cliente C005) (smartphone none) (computador ThinkPad) (accesorio none) (qty 1) (metodo-pago tarjeta) (total 42000)))
(assert (orden (cliente C006) (smartphone XR20) (computador ZenBook) (accesorio Ultra64GB) (qty 2) (metodo-pago tarjeta) (total 81200)))
(assert (orden (cliente C007) (smartphone none) (computador none) (accesorio Dock1) (qty 1) (metodo-pago vale) (total 800)))
(assert (orden (cliente C008) (smartphone GTNeo2) (computador none) (accesorio none) (qty 1) (metodo-pago tarjeta) (total 14999)))
(assert (orden (cliente C009) (smartphone none) (computador Gram17) (accesorio none) (qty 1) (metodo-pago efectivo) (total 37500)))
(assert (orden (cliente C010) (smartphone 9Pro) (computador none) (accesorio USB3.0) (qty 1) (metodo-pago tarjeta) (total 31000)))
(assert (orden (cliente C011) (smartphone none) (computador Blade15) (accesorio WH1000XM4) (qty 1) (metodo-pago vale) (total 68000)))
(assert (orden (cliente C012) (smartphone Velvet) (computador SurfacePro7) (accesorio none) (qty 1) (metodo-pago tarjeta) (total 58000)))
(assert (orden (cliente C013) (smartphone Axon30) (computador none) (accesorio Base) (qty 2) (metodo-pago tarjeta) (total 21400)))
(assert (orden (cliente C014) (smartphone none) (computador Aero15) (accesorio none) (qty 1) (metodo-pago efectivo) (total 45500)))
(assert (orden (cliente C015) (smartphone Magic3) (computador MiNotebook) (accesorio Audifonos) (qty 1) (metodo-pago tarjeta) (total 67000)))

; ----------------------------
; Hechos para Tarjetas de Crédito
; ----------------------------
(assert (tarjeta_credito (banco BBVA) (grupo Visa) (expiracion 12/26) (tipo oro)))
(assert (tarjeta_credito (banco Santander) (grupo MasterCard) (expiracion 11/25) (tipo plata)))
(assert (tarjeta_credito (banco Banamex) (grupo Visa) (expiracion 09/24) (tipo oro)))
(assert (tarjeta_credito (banco HSBC) (grupo MasterCard) (expiracion 10/26) (tipo clásica)))
(assert (tarjeta_credito (banco Banorte) (grupo Visa) (expiracion 01/27) (tipo platino)))
(assert (tarjeta_credito (banco Scotiabank) (grupo MasterCard) (expiracion 08/24) (tipo oro)))
(assert (tarjeta_credito (banco Inbursa) (grupo Visa) (expiracion 06/25) (tipo oro)))
(assert (tarjeta_credito (banco Afirme) (grupo MasterCard) (expiracion 07/26) (tipo clásica)))
(assert (tarjeta_credito (banco Azteca) (grupo Visa) (expiracion 03/25) (tipo básica)))
(assert (tarjeta_credito (banco BanCoppel) (grupo MasterCard) (expiracion 05/27) (tipo oro)))
(assert (tarjeta_credito (banco BBVA) (grupo MasterCard) (expiracion 02/28) (tipo platino)))
(assert (tarjeta_credito (banco Santander) (grupo Visa) (expiracion 04/27) (tipo clásica)))
(assert (tarjeta_credito (banco Banamex) (grupo MasterCard) (expiracion 10/26) (tipo oro)))
(assert (tarjeta_credito (banco HSBC) (grupo Visa) (expiracion 12/25) (tipo platino)))
(assert (tarjeta_credito (banco Banorte) (grupo MasterCard) (expiracion 09/24) (tipo oro)))


; ----------------------------
; Hechos para Vales
; ----------------------------
(assert (vale (valor 1000) (fecha-expiracion 2025-12-31) (aplicable-a smartphone) (cliente C001) (estatus activo)))
(assert (vale (valor 2000) (fecha-expiracion 2025-10-15) (aplicable-a computador) (cliente C002) (estatus activo)))
(assert (vale (valor 500) (fecha-expiracion 2025-08-30) (aplicable-a accesorio) (cliente C003) (estatus usado)))
(assert (vale (valor 1500) (fecha-expiracion 2025-11-20) (aplicable-a computador) (cliente C004) (estatus vencido)))
(assert (vale (valor 800) (fecha-expiracion 2025-09-10) (aplicable-a smartphone) (cliente C005) (estatus activo)))
(assert (vale (valor 1000) (fecha-expiracion 2025-12-01) (aplicable-a accesorio) (cliente C006) (estatus activo)))
(assert (vale (valor 750) (fecha-expiracion 2025-10-25) (aplicable-a smartphone) (cliente C007) (estatus usado)))
(assert (vale (valor 1200) (fecha-expiracion 2025-12-15) (aplicable-a computador) (cliente C008) (estatus activo)))
(assert (vale (valor 900) (fecha-expiracion 2025-09-20) (aplicable-a accesorio) (cliente C009) (estatus vencido)))
(assert (vale (valor 1100) (fecha-expiracion 2025-11-11) (aplicable-a smartphone) (cliente C010) (estatus activo)))
(assert (vale (valor 1300) (fecha-expiracion 2025-12-05) (aplicable-a computador) (cliente C011) (estatus activo)))
(assert (vale (valor 700) (fecha-expiracion 2025-10-10) (aplicable-a accesorio) (cliente C012) (estatus usado)))
(assert (vale (valor 1500) (fecha-expiracion 2025-11-30) (aplicable-a computador) (cliente C013) (estatus activo)))
(assert (vale (valor 1000) (fecha-expiracion 2025-09-15) (aplicable-a smartphone) (cliente C014) (estatus vencido)))
(assert (vale (valor 2000) (fecha-expiracion 2025-12-20) (aplicable-a accesorio) (cliente C015) (estatus activo)))
