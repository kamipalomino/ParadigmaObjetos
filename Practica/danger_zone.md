# Danger Zone

> En un edificio de Manhattan, disfrazado como una tintorería, existe una agencia de espionaje llamada ISIS (Servicio Internacional de Inteligencia Secreta), que cuenta con los mejores agentes de Estados Unidos. Si bien el servicio de lavandería es bien retribuido, los principales ingresos de la agencia están ligados a la resolución efectiva de misiones.

> Todos los empleados poseen __habilidades__, las cuales usan para resolver misiones, y una cantidad de __salud variable.__ Sabemos que los empleados quedan __incapacitados__ cuando su _salud se encuentra por debajo de su salud crítica._

> Los distintos empleados que necesitamos representar son o bien _espías u oficinistas_, los cuales reaccionan de maneras diversas:

__Espías:__ Son los referentes más importantes dentro de la agencia y son capaces de aprender nuevas habilidades al completar misiones. La _salud crítica_ de los espías es 15.

__Oficinistas:__ de alguna forma u otra siempre terminan involucrándose en las misiones. Sabemos que si un oficinista sobrevive a una misión gana una ⭐. Su _salud crítica_ es de 40 - 5 * la _cantidad de estrellas_ que tenga.


Para resolver una misión, los empleados pueden conformar _equipos_, para colaborar y mejorar sus chances de éxito.


Además algunos empleados son __jefes__ de otros empleados, y pueden ser asistidos por ellos cuando la misión lo amerite. Los __jefes__ también pueden ser tanto _espías_ como _oficinistas._


>Se pide:

1. Saber si un empleado está _incapacitado._
2. Saber si un empleado puede usar una habilidad, que se cumple si no está incapacitado y efectivamente posee la habilidad indicada. En el caso de los jefes, también consideramos que la posee si alguno de sus subordinados la puede usar.p
3. Hacer que un empleado o un equipo cumpla una misión.
Esto sólo puede llevarse a cabo si quien la cumple reúne todas las habilidades requeridas de la misma (si puede usarlas todas). Para los equipos alcanza con que al menos uno de sus integrantes pueda usar cada una de ellas.

>Luego, el empleado o el equipo que cumplió la misión recibe daño en base a la peligrosidad de la misión. Para los equipos, esto implica que todos los integrantes reciban un tercio del daño total.

>Por último, los empleados que sobreviven al finalizar la misión (por tener salud > 0) registran que la completaron, teniendo en cuenta que:
- Los oficinistas consiguen una estrella. Cuando un oficinista junta tres estrellas adquiere la suficiente experiencia como para empezar a trabajar de espía.
- Los espías aprenden las habilidades de la misión que no poseían.