# Matriz de Casos de Prueba – SauceDemo

**Responsable QA:** Katerin L. Hernández N.  
**Entorno:** `https://www.saucedemo.com/`  

---

## Módulo 1: Autenticación (Login)

| ID | Tipo | Título | Datos de Prueba | Pasos de Ejecución | Resultado Esperado | Estado |
| :--- | :--- | :--- | :--- | :--- | :--- | :---: |
| **TC-LOG-01** | Positivo | Inicio de sesión exitoso con usuario estándar | User: `standard_user`<br>Pass: `secret_sauce` | 1. Ingresar usuario.<br>2. Ingresar contraseña.<br>3. Clic en **Login**. | Redirección a `/inventory.html` mostrando el catálogo de productos. | `PASS` |
| **TC-LOG-02** | Negativo | Intento de login con usuario bloqueado | User: `locked_out_user`<br>Pass: `secret_sauce` | 1. Ingresar usuario bloqueado.<br>2. Ingresar contraseña.<br>3. Clic en **Login**. | Acceso denegado. Se muestra alerta: *"Epic sadface: Sorry, this user has been locked out."* | `PASS` |
| **TC-LOG-03** | Negativo | Intento de login con contraseña incorrecta | User: `standard_user`<br>Pass: `clave_erronea` | 1. Ingresar usuario válido.<br>2. Ingresar clave errónea.<br>3. Clic en **Login**. | Acceso denegado. Se muestra mensaje indicando que el usuario y contraseña no coinciden. | `PASS` |
| **TC-LOG-04** | Negativo | Intento de login con campos vacíos | User: *(vacío)*<br>Pass: *(vacío)* | 1. Dejar ambos campos vacíos.<br>2. Clic en **Login**. | El sistema bloquea el ingreso y muestra: *"Epic sadface: Username is required"*. | `PASS` |

---

## Módulo 2: Catálogo y Carrito de Compras

| ID | Tipo | Título | Datos de Prueba | Pasos de Ejecución | Resultado Esperado | Estado |
| :--- | :--- | :--- | :--- | :--- | :--- | :---: |
| **TC-CAR-01** | Positivo | Agregar un producto al carrito | Producto: *Sauce Labs Backpack* | 1. Iniciar sesión como `standard_user`.<br>2. Clic en **Add to cart** en *Sauce Labs Backpack*. | El botón cambia a **Remove** y el ícono del carrito muestra el contador `1`. | `PASS` |
| **TC-CAR-02** | Positivo | Eliminar producto desde el carrito | Producto: *Sauce Labs Backpack* | 1. Entrar al ícono del carrito.<br>2. Clic en **Remove**. | El producto desaparece de la lista y el contador del carrito se oculta. | `PASS` |
| **TC-CAR-03** | Positivo | Ordenar catálogo por precio (menor a mayor) | Filtro: *Price (low to high)* | 1. En `/inventory.html`, abrir selector de orden.<br>2. Seleccionar *Price (low to high)*. | Los productos se reorganizan comenzando por el de menor valor (`$7.99`). | `PASS` |
| **TC-CAR-04** | Negativo / Exploratorio | Validación de imágenes de catálogo con `problem_user` | User: `problem_user`<br>Pass: `secret_sauce` | 1. Iniciar sesión con `problem_user`.<br>2. Revisar las imágenes de todos los productos. | Cada producto debe mostrar su imagen correspondiente. *(Falla detectada: ver `BUG-002`)*. | `FAIL` |

---

## Módulo 3: Flujo de Checkout

| ID | Tipo | Título | Datos de Prueba | Pasos de Ejecución | Resultado Esperado | Estado |
| :--- | :--- | :--- | :--- | :--- | :--- | :---: |
| **TC-CHK-01** | Positivo | Compra completa exitosa (E2E) | Nombre: `Katerin`<br>Apellido: `Hernandez`<br>CP: `1530000` | 1. Agregar producto al carrito.<br>2. Clic en **Checkout**.<br>3. Llenar datos y clic en **Continue**.<br>4. Clic en **Finish**. | Redirección a `/checkout-complete.html` con el mensaje: *"Thank you for your order!"*. | `PASS` |
| **TC-CHK-02** | Negativo | Avance de checkout sin Código Postal | Nombre: `Katerin`<br>Apellido: `Hernandez`<br>CP: *(vacío)* | 1. Ir a Checkout.<br>2. Llenar Nombre y Apellido.<br>3. Dejar Código Postal vacío y clic en **Continue**. | El sistema bloquea el avance y muestra: *"Error: Postal Code is required"*. | `PASS` |
| **TC-CHK-03** | Negativo / Exploratorio | Ingreso de datos en Checkout con `problem_user` | User: `problem_user`<br>Nombre: `Katerin`<br>Apellido: `Hernandez` | 1. Iniciar sesión como `problem_user` y agregar producto.<br>2. Ir a Checkout.<br>3. Escribir Nombre y luego Apellido.<br>4. Clic en **Continue**. | El sistema debe conservar ambos campos y permitir avanzar al resumen de compra. *(Falla detectada: ver `BUG-001`)*. | `FAIL` |
