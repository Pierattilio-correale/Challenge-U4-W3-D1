/* 1) estrarre tutti i clienti di nome mario */
select * 
from clienti
where nome='Mario';



/* 2) estrarre il nome e il cognome dei clienti nati nel 1982 */
select nome , cognome 
from clienti
where anno_di_nascita=1982;


/* 3) estrarre il nome e il cognome dei clienti nati nel 1982 */
select count(*) as numero_fatture
from fatture 
where iva=20;

/* 4) estrarre i prodotti attivati nel 2017 e che sono in produzione
oppure in commercio */

select *
from prodotti 
where (in_commercio= true or in_produzione=true) and extract(year from data_attivazione)=2017;


/* 5) Estrarre le fatture con importo inferiore a 1000 e i dati dei clienti ad esse collegate  */
select *
from fatture f, clienti c
where f.id_cliente=c.numero_cliente and f.importo<1000;

/* 6)Riportare l’elenco delle fatture (numero, importo, iva e data) con in aggiunta il nome del fornitore  */
select numero_fattura , importo, iva , data_fattura
from fatture fa , fornitori fo
where fa.numero_fornitore =fo.numero_fornitore;

/* 7)Considerando soltanto le fatture con iva al 20 per cento, estrarre il numero di fatture per ogni anno (Per estrarre l’anno da una data si può usare EXTRACT(YEAR FROM data)  */

select extract(year from data_fattura ) as anno, count(*) as numero_fatture
from fatture
where iva=20 
group by extract(year from data_fattura);

/* 8)Riportare il numero di fatture e la somma dei relativi importi divisi per anno di fatturazione  */
select extract(year from data_fattura ) as anno, count(*) as numero_fatture , sum(importo)as somma_importi
from fatture
 
group by extract(year from data_fattura);

/*[EXTRA] Estrarre gli anni in cui sono state registrate più di 2 fatture con tipologia ‘A’*/

select extract(year from data_fattura ) as anno, count(*) as numero_fatture 
from fatture
where tipologia='A'
group by extract(year from data_fattura)
having count (*)>2;

/*[EXTRA] Estrarre il totale degli importi delle fatture divisi per residenza dei clienti*/
select sum(f.importo) as totale_degli_importi, regione_di_residenza
from fatture f,clienti c
where f.id_cliente=c.numero_cliente
group by c.regione_di_residenza;

/* [EXTRA] Estrarre il numero dei clienti nati nel 1980 che hanno almeno una fattura superiore a 50 euro*/
select count(distinct c.numero_cliente) as numero_clienti
from clienti c
join fatture f on c.numero_cliente = f.id_cliente
where c.anno_di_nascita = 1980
  and f.importo > 50;