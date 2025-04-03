SELECT c.id, c.nombre, c.apellidos, COUNT(a.id) AS total_alquileres
FROM clientes c
JOIN alquiler a ON c.id = a.id_cliente
WHERE a.fecha_alquiler >= CURDATE() - INTERVAL 6 MONTH
GROUP BY c.id
ORDER BY total_alquileres DESC
LIMIT 1;

SELECT p.titulo, COUNT(a.id) AS total_alquileres
FROM alquiler a
JOIN inventario i ON a.id_inventario = i.id
JOIN pelicula p ON i.id_pelicula = p.id
WHERE a.fecha_alquiler >= CURDATE() - INTERVAL 1 YEAR
GROUP BY p.id
ORDER BY total_alquileres DESC
LIMIT 5;

SELECT c.nombre AS categoria, SUM(p.total) AS ingresos_totales, COUNT(a.id) AS total_alquileres
FROM alquiler a
JOIN inventario i ON a.id_inventario = i.id
JOIN pelicula_categoria pc ON i.id_pelicula = pc.id_pelicula
JOIN categoria c ON pc.id_categoria = c.id
JOIN pago p ON a.id = p.id_alquiler
GROUP BY c.id;


SELECT i.nombre AS idioma, COUNT(DISTINCT a.id_cliente) AS total_clientes
FROM alquiler a
JOIN inventario inv ON a.id_inventario = inv.id
JOIN pelicula p ON inv.id_pelicula = p.id
JOIN idioma i ON p.id_idioma = i.id
WHERE MONTH(a.fecha_alquiler) = 4 AND YEAR(a.fecha_alquiler) = 2025  -- Cambiar mes/año según se necesite
GROUP BY i.id;


SELECT c.id, c.nombre, c.apellidos
FROM clientes c
JOIN alquiler a ON c.id = a.id_cliente
JOIN inventario inv ON a.id_inventario = inv.id
JOIN pelicula_categoria pc ON inv.id_pelicula = pc.id_pelicula
WHERE NOT EXISTS (
    SELECT 1
    FROM pelicula_categoria pc2
    WHERE pc2.id_categoria = pc.id_categoria
    AND NOT EXISTS (
        SELECT 1
        FROM alquiler a2
        JOIN inventario inv2 ON a2.id_inventario = inv2.id
        WHERE a2.id_cliente = c.id AND inv2.id_pelicula = pc2.id_pelicula
    )
)
GROUP BY c.id;



SELECT ci.nombre AS ciudad, COUNT(c.id) AS total_clientes
FROM clientes c
JOIN direccion d ON c.id_direccion = d.id
JOIN ciudad ci ON d.id_ciudad = ci.id
WHERE c.activo = 1 AND c.ultima_actualizacion >= CURDATE() - INTERVAL 3 MONTH
GROUP BY ci.id
ORDER BY total_clientes DESC
LIMIT 3;



SELECT c.nombre AS categoria, COUNT(a.id) AS total_alquileres
FROM alquiler a
JOIN inventario i ON a.id_inventario = i.id
JOIN pelicula_categoria pc ON i.id_pelicula = pc.id_pelicula
JOIN categoria c ON pc.id_categoria = c.id
WHERE a.fecha_alquiler >= CURDATE() - INTERVAL 1 YEAR
GROUP BY c.id
ORDER BY total_alquileres ASC
LIMIT 5;



SELECT c.id, c.nombre, c.apellidos, AVG(DATEDIFF(a.fecha_devolucion, a.fecha_alquiler)) AS promedio_dias
FROM alquiler a
JOIN clientes c ON a.id_cliente = c.id
GROUP BY c.id;

SELECT e.nombre, e.apellidos, COUNT(a.id) AS total_alquileres
FROM alquiler a
JOIN empleado e ON a.id_empleado = e.id
JOIN inventario i ON a.id_inventario = i.id
JOIN pelicula_categoria pc ON i.id_pelicula = pc.id_pelicula
JOIN categoria c ON pc.id_categoria = c.id
WHERE c.nombre = 'Acción'
GROUP BY e.id
ORDER BY total_alquileres DESC
LIMIT 5;
