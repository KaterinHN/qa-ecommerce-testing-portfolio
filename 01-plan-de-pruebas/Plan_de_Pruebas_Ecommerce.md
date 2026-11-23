Plan de Pruebas Funcionales – Plataforma E-commerce (SauceDemo)

Autora: Katerin L. Hernández N. – Ingeniera de Sistemas | Analista QA

Aplicación bajo prueba (AUT): SauceDemo (https://www.saucedemo.com/)

Versión del documento: 1.0

1. Objetivo

Validar el correcto funcionamiento de los flujos críticos de negocio de la tienda online SauceDemo, garantizando que los usuarios puedan autenticarse, gestionar productos en el carrito y completar el proceso de compra (checkout) sin errores funcionales ni pérdida de integridad en los datos.

2. Alcance

En alcance (In Scope)

Módulo de Autenticación: Inicio de sesión con credenciales válidas, inválidas, campos vacíos y usuario bloqueado (locked_out_user).

Módulo de Catálogo y Carrito: Visualización de productos, ordenamiento por precio/nombre, agregar y eliminar ítems del carrito.

Módulo de Checkout: Validación de formulario de envío, cálculo de subtotal/impuestos/total y confirmación de orden.

Pruebas de Regresión y Exploratorias: Detección de defectos funcionales utilizando el perfil problem_user.

Fuera de alcance (Out of Scope)

Pruebas de carga, estrés y rendimiento masivo.

Integración con pasarelas de pago reales (el entorno es simulado).

Pruebas de compatibilidad en versiones obsoletas de navegadores (ej. Internet Explorer).

3. Estrategia y Tipos de Prueba

Pruebas de Humo (Smoke Testing): Verificación rápida de que la aplicación carga y permite el login básico.

Pruebas Funcionales (Caja Negra): Diseño de casos positivos (Happy Path), negativos y de borde aplicando partición de equivalencia.

Pruebas Exploratorias: Navegación libre orientada a descubrir defectos de interfaz, datos o lógica en flujos críticos.

4. Entorno y Datos de Prueba

URL: https://www.saucedemo.com/

Navegador: Google Chrome (última versión estable) + Chrome DevTools.

Sistema Operativo: Windows 11.

Usuarios de prueba:

Usuario estándar: standard_user / secret_sauce

Usuario bloqueado: locked_out_user / secret_sauce

Usuario con anomalías conocidas: problem_user / secret_sauce

5. Criterios de Entrada y Salida

Criterios de Entrada

Entorno web accesible y operativo.

Casos de prueba diseñados y revisados.

Credenciales de prueba disponibles.

Criterios de Salida

100% de los casos de prueba planificados ejecutados.

100% de los defectos críticos o bloqueantes documentados con pasos reproducibles y evidencia visual.

Resumen de ejecución actualizado en el README.md del repositorio.
