# 🧪 Portafolio QA: Testing Funcional y Validación de Datos (E-commerce)

**Autora:** Katerin L. Hernández N. – Ingeniera de Sistemas | Analista QA  
**Aplicación bajo prueba:** [SauceDemo](https://www.saucedemo.com/)

Este repositorio documenta un ciclo de pruebas de software (STLC) aplicado a un flujo de comercio electrónico, abarcando planificación, diseño de casos de prueba, reporte de defectos reales con evidencia y validación de integridad de datos en SQL.

---

## 📊 Resumen de Ejecución

| Módulo | Casos Diseñados | Ejecutados | Passed | Failed | Bugs Reportados |
| :--- | :---: | :---: | :---: | :---: | :---: |
| Autenticación (Login) | 4 | 4 | 4 | 0 | 0 |
| Catálogo y Carrito | 4 | 4 | 3 | 1 | 1 |
| Flujo de Checkout | 3 | 3 | 2 | 1 | 1 |
| **Total** | **11** | **11** | **9** | **2** | **2** |

---

## 📁 Estructura del Repositorio

* **[01. Plan de Pruebas](./01-plan-de-pruebas/Plan_de_Pruebas_Ecommerce.md):** Objetivos, alcance, estrategia, entorno y criterios de aceptación.
* **[02. Matriz de Casos de Prueba](./02-casos-de-prueba/Casos_de_Prueba_SauceDemo.md):** Casos positivos, negativos y exploratorios (Login, Carrito y Checkout).
* **[03. Reporte de Defecto (BUG-001)](./03-reportes-de-bugs/BUG-001_Error_Checkout_Apellido.md):** Hallazgo crítico reproducible en el flujo de checkout con evidencia visual.
* **[04. Validación de Datos en SQL](./04-validacion-sql/queries_validacion_ordenes.sql):** Consultas MySQL para verificar consistencia de órdenes, cálculos, duplicados e inventario.

---

## 🛠️ Herramientas y Técnicas Aplicadas
* **Testing:** Pruebas Funcionales (Caja Negra), Smoke Testing, Regresión, Pruebas Exploratorias, Partición de Equivalencia.
* **Técnicas y Datos:** MySQL, Chrome DevTools, Markdown, Git & GitHub.

---

## 📫 Contacto
* **LinkedIn:** [linkedin.com/in/katerinhernandezn](https://www.linkedin.com/in/katerinhernandezn)
* **Email:** katerinhernandez2616@gmail.com
