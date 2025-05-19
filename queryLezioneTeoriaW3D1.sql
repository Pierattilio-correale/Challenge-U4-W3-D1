/* voglio estrarre la sede del dipartimento
dell'impiegato sili*/

select *
from impiegato,dipartimento
/*prodotto cartesiano , prende tutti i record
della prima tabella e li va ad assegnare
a tutti i record della seconda tabella
*/

/*per avere il risultato giusto dobbiamo
applicare una condizione di join*
la condizione è che la primary key di una tabella
deve essere uguale alla foreing key dell'
altra tabella*/
where cognome='Sili';


/*risultato corretto
inner join implicità*/


select *
from impiegato,dipartimento

where cognome='Sili' and dipartimento=codice;


select sede
from impiegato,dipartimento

where cognome='Sili' and dipartimento=codice;

/*inner join esplicità*/

SELECT i.cognome, i.stipendio
FROM impiegato i
JOIN dipartimento d ON i.dipartimento = d.codice
WHERE d.sede = 'Napoli';


select cognome , nome
from impiegato i , dipartimento d
where i.dipartimento=d.codice;



select cognome 
from impiegato i , dipartimento d
where i.matricola=d.direttore;

/* voglio il cognome dell'dipendente che ha lo 
stipendio massimo
select cognome , max(stipendio)
from impiegato ;*/

/* query annidata semplice*/
/*il dbms esegue prima la query interna
(quella nella where) e poi utilizza i dati
restituiti dalla query interna per eseguire
la query esterna*/
SELECT cognome, stipendio
FROM impiegato 
WHERE stipendio = (SELECT MAX(stipendio) 
                   FROM impiegato);
				   