-- ============================================================================
-- SUITE DE VALIDACIÓN DE DATOS PARA QA - E-COMMERCE
-- Autora: Katerin L. Hernández N. | Ingeniera de Sistemas & Analista QA
-- ============================================================================

-- 1. VERIFICAR QUE UNA ORDEN CREADA EN CHECKOUT EXISTA EN BASE DE DATOS
-- Caso de prueba asociado: TC-CHK-01 (Compra exitosa)
SELECT 
    o.order_id,
    u.email,
    o.status,
    o.total_amount,
    o.created_at
FROM orders o
INNER JOIN users u ON o.user_id = u.user_id
WHERE u.email = 'katerin.test@ejemplo.com'
ORDER BY o.created_at DESC
LIMIT 5;

-- 2. VALIDAR INTEGRIDAD DE CÁLCULOS (SUBTOTAL + IMPUESTO = TOTAL)
-- Detecta discrepancias financieras entre el detalle de la orden y el total cobrado
SELECT 
    o.order_id,
    SUM(oi.quantity * oi.unit_price) AS subtotal_calculado,
    o.tax_amount,
    o.total_amount AS total_registrado,
    (SUM(oi.quantity * oi.unit_price) + o.tax_amount) - o.total_amount AS diferencia
FROM orders o
INNER JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY o.order_id, o.tax_amount, o.total_amount
HAVING diferencia <> 0;
-- Resultado esperado en QA: 0 filas (sin diferencias de cálculo)

-- 3. DETECTAR REGISTROS HUÉRFANOS (ÓRDENES SIN ÍTEMS ASOCIADOS)
-- Verifica que no existan compras procesadas con carrito vacío
SELECT 
    o.order_id,
    o.status,
    o.created_at
FROM orders o
LEFT JOIN order_items oi ON o.order_id = oi.order_id
WHERE oi.order_item_id IS NULL;
-- Resultado esperado en QA: 0 filas

-- 4. VALIDAR QUE NO EXISTAN USUARIOS DUPLICADOS POR CORREO ELECTRÓNICO
-- Caso de prueba negativo: Registro duplicado
SELECT 
    email,
    COUNT(*) AS cantidad_registros
FROM users
GROUP BY email
HAVING COUNT(*) > 1;
-- Resultado esperado en QA: 0 filas

-- 5. VERIFICAR QUE EL STOCK NO QUEDE EN NEGATIVO TRAS COMPRAS CONCURRENTES
-- Caso de prueba de borde: Agotamiento de inventario durante checkout
SELECT 
    product_id,
    product_name,
    stock_quantity
FROM products
WHERE stock_quantity < 0;
-- Resultado esperado en QA: 0 filas
