


--A. Escriba la consulta en SQL que devuelva el nombre del proyecto y sus productos
--correspondientes del proyecto premia cuyo código es 1

SELECT p.nombre_proyecto, pr.nombre_producto 
FROM PROYECTO p 
INNER JOIN PRODUCTO pr ON p.codigo_proyecto = pr.codigo_proyecto 
WHERE p.codigo_proyecto = 1

--B. Escriba una consulta SQL que devuelva los distintos mensajes que hay, indicando a qué
--proyecto y producto pertenecen.

SELECT m.mensaje, p.nombre_proyecto, pr.nombre_producto 
FROM MENSAJE m 
INNER JOIN PROYECTO p ON m.codigo_proyecto = p.codigo_proyecto 
INNER JOIN PRODUCTO pr ON m.codigo_producto = pr.codigo_producto 


--C. Consulta SQL para devolver los distintos mensajes que hay, indicando a qué proyecto y producto pertenecen. 
--Pero si el mensaje está en todos los productos de un proyecto, en lugar de mostrar cada producto, 
--debe mostrar el nombre del proyecto y un solo producto que diga “TODOS”:

SELECT m.mensaje, p.nombre_proyecto, 
    COALESCE(pr.nombre_producto, 'TODOS') AS nombre_producto
FROM MENSAJE m 
INNER JOIN PROYECTO p ON m.codigo_proyecto = p.codigo_proyecto 
LEFT JOIN PRODUCTO pr ON m.codigo_producto = pr.codigo_producto 
    AND pr.codigo_proyecto = p.codigo_proyecto