-- 1. Cuántos artistas tenemos 
select count(DISTINCT Name) as Num_Artistas from artists a ;

-- 2. A qué artista pertenece el álbúm "Voodo Lounge"
SELECT 
a.Name as Artista, 
b.Title as Nombre_Album 
from artists a inner join albums b on (a.ArtistId=b.ArtistId) 
where b.Title ="Voodoo Lounge";

-- 3. Cuáles son los álbumes que tiene el artista Ozzy Osbourne
SELECT 
a.Name as Artista, 
b.Title as Nombre_Album 
from artists a inner join albums b on (a.ArtistId=b.ArtistId) 
where a.Name ="Ozzy Osbourne";

-- 4.Cuántas canciones tiene el artista Red Hot Chili Peppers
SELECT 
a.Name as Artista, 
b.Title as Nombre_Album ,
count(DISTINCT c.Name) as Num_Canciones
from artists a left join albums b on (a.ArtistId=b.ArtistId) left join 
tracks c on (b.AlbumId=c.AlbumId)
where a.Name ="Red Hot Chili Peppers"
group by a.Name, b.Title ;

-- 5.Cuales son los tres tracks más largos (tiempo)
SELECT
t.Name as Nombre_Cancion, 
t.Milliseconds/60000 AS Duracion_minutos
from tracks t order by Milliseconds desc limit 3;

-- 6. Cuál es el genero de la canción que menos peso tiene (Bytes)
select 
t.Name as Nombre_Cancion,
t.Bytes, 
g.Name  as Genero
from tracks t left join genres g on (t.GenreId=g.GenreId)
order by t.Bytes DESC limit 1;

-- 7.Cuál es el genero con mas canciones
select 
g.Name  as Genero,
count(DISTINCT t.Name) as Num_tracks 
from tracks t left join genres g on (t.GenreId=g.GenreId)
group by g.Name 
order by Num_tracks DESC;

-- 8.Indicar el top 10 de los artistac con más canciones
SELECT 
a.Name as Artista, 
count(DISTINCT c.Name) as Num_Canciones
from artists a left join albums b on (a.ArtistId=b.ArtistId) left join 
tracks c on (b.AlbumId=c.AlbumId)
group by a.Name
order by Num_Canciones desc limit 10;


-- 9. Cuántos Invoices tiene cada empleado, organizar del mayor al menor
select 
e.FirstName || ' ' || e.LastName as Nombre_Empleado,
--c.CustomerId ,
count(DISTINCT i.InvoiceId) as num_Invoices 
from employees e left join
customers c  on (e.EmployeeId=c.SupportRepId) left JOIN 
invoices i on (c.CustomerId=i.CustomerId) 
group by Empleado
order by num_Invoices desc;


-- 10. Cuál es la canción que más existe en las playlist
SELECT 
    t.Name AS Cancion,
    COUNT(pt.TrackId) AS Veces_en_playlists
FROM playlist_track pt
JOIN tracks t ON pt.TrackId = t.TrackId
GROUP BY t.Name
ORDER BY Veces_en_playlists DESC
LIMIT 1;



