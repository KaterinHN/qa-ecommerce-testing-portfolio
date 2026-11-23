# Reporte de Defecto: BUG-001

| Campo | Detalle |
| :--- | :--- |
| **ID del Defecto** | `BUG-001` |
| **Título** | El campo "Last Name" sobrescribe el campo "First Name" e impide completar el checkout (`problem_user`) |
| **Caso de Prueba Relacionado** | `TC-CHK-03` |
| **Módulo** | Checkout – Información del Comprador (`/checkout-step-one.html`) |
| **Severidad** | **Crítica** (Bloquea completamente la finalización de la compra) |
| **Prioridad** | **Alta (P1)** |
| **Estado** | Abierto (Open) |
| **Reportado por** | Katerin L. Hernández N. – Analista QA |

---

## Entorno de Ejecución
* **URL:** `https://www.saucedemo.com/checkout-step-one.html`
* **Usuario:** `problem_user`
* **Navegador:** Google Chrome (Desktop)
* **Sistema Operativo:** Windows 11

---

## Precondiciones
1. El usuario ha iniciado sesión con las credenciales `problem_user` / `secret_sauce`.
2. Existe al menos un producto agregado al carrito de compras.

---

## Pasos para Reproducir
1. Hacer clic en el ícono del carrito de compras en la esquina superior derecha.
2. Hacer clic en el botón **Checkout**.
3. Ingresar `"Katerin"` en el campo **First Name**.
4. Hacer clic en el campo **Last Name** e intentar escribir `"Hernandez"`.
5. Ingresar `"1530000"` en el campo **Zip/Postal Code**.
6. Hacer clic en el botón **Continue**.

---

## Resultado Esperado
* El campo **First Name** debe conservar el valor `"Katerin"`.
* El campo **Last Name** debe registrar correctamente el valor `"Hernandez"`.
* Al hacer clic en **Continue**, el sistema debe redirigir a la pantalla de resumen (`/checkout-step-two.html`).

---

## Resultado Actual
* Al escribir en el campo **Last Name**, el texto no se guarda en dicho campo sino que **sobrescribe el contenido de First Name** (reemplazando el texto ingresado inicialmente).
* El campo **Last Name** permanece vacío.
* Al presionar **Continue**, el flujo se bloquea mostrando el error: `Error: Last Name is required`.

---

## Evidencia Adjunta:
![Evidencia del error en Checkout](./evidencias/bug001_checkout.png)
