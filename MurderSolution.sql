/*Buscar sucesos en la fecha y ciudad*/
SELECT *FROM crime_scene_reportWHERE type = "murder" AND date = "20180115"AND city = "SQL City";
/*RESPUESTA*/
Security footage shows that there were 2 witnesses. The first witness lives at the last house on "Northwestern Dr". 
The second witness, named Annabel, lives somewhere on "Franklin Ave".
/*Con la información que proporcionan los testigos se buscan sus datos para obtener sus id y y poder ver las entrevistas*/
SELECT *FROM person WHERE address_street_name LIKE 'Franklin Ave';
/*RESPUESTA*/
16371ﾠAnnabel Millerﾠ490173ﾠ103ﾠFranklin Aveﾠ318771143

SELECT *FROM personWHERE address_street_name LIKE "Northwestern Dr" ORDER BY address_number DESC
/*RESPUESTA*/
idﾠnameﾠlicense_idﾠaddress_numberﾠaddress_street_nameﾠssn
14887ﾠMorty Schapiroﾠ118009ﾠ4919ﾠNorthwestern Drﾠ111564949
/*Se obtienen las entrevistas de los testigos y con los datos proporcionados se buscan los datos de los sospechosos */
SELECT *FROM interview WHERE person_id = 14887 OR person_id = 16371
/*RESPUESTA*/
14887	I heard a gunshot and then saw a man run out. He had a "Get Fit Now Gym" bag. The membership number on the bag started with "48Z". Only gold members have those bags. The man got into a car with a plate that included "H42W".
16371	I saw the murder happen, and I recognized the killer from my gym when I was working out last week on January the 9th.
/*Se buscan los datos de los sospechosos con la información de los testigos relacionada con el gimnasio*/
SELECT *FROM get_fit_now_member WHERE membership_status LIKE 'Gold' AND id LIKE '48Z%'
/*RESPUESTA*/
48Z7A	28819	Joe Germuska	20160305	gold
48Z55	67318	Jeremy Bowers	20160101	gold
/*Se busca con la información de la matricula datos de los sospechosos y se obtiene el license_id*/
SELECT * FROM drivers_license WHERE plate_number LIKE '%H42W%' AND gender LIKE 'male'
/*RESPUESTA*/
423327	30	70	brown	brown	male	0H42W2	Chevrolet	Spark LS
664760	21	71	black	black	male	4H42WR	Nissan	Altima
/*con el license_id se obtienen los datos de dos sospechosos*/
SELECT * FROM person WHERE license_id IN ("423327", "664760")
/*RESPUESTA*/
51739	Tushar Chandra	664760	312	Phi St	137882671
67318	Jeremy Bowers	423327	530	Washington Pl, Apt 3A	871539279
/*Se deduce que es Jeremy Bowers ya que coincide con los datos de la matricula y los datos del gimnasio proporcionados por los testigos*/

/*SOLUCIÓN*/
INSERT INTO solution VALUES (1, 'Jeremy Bowers');
        
SELECT value FROM solution;