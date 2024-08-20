# Ejercicio-LEX
Integrantes:

Jose Santiago Gonzalez y Elkin Benitez

#Punto 1

Para correr este primer ejercicio se necesita un archivo de texto txt, en la consola de comandos se usa el comando "./Punto1 archivo.txt" para correr el programa

#punto 2

Para correr este ejercicio se nesita realizar un archivo de texto de tipo .l el cual es reconocido por flex y en este estaran las normas y funciones que flex seguira para ejecutar. Para eeste caso de un traductor de ingles a español, en el archivo de texto se tendra un diccionario con ciertas palabras, luego al ejecutar este traducira las plaabras del diccionario o frases que se puedan realizar ocn la combinacion de estas palabras

nano traductor.l -> abrira un archivo de texto tipo nano donde se escribiran las reglsa y funciones,
flex traductor.l -> creara un arhcivo de tipo C,
gcc -o traductor lex.yy.c -lfl -> esto ejecutara el archivo de tipo C, 
./traductor -> permitira probar el programa y utilizarlo

#Punto 3
Para correr este programa solo se necesita ejecutar "./punto3" y añadir una expresion matematica o un simbolo de los que se puede encontrar en una calcualdora no cientifica

#Punto 4
para este programa se necesita un archivo txt con la siguente estructura "123 + 45 * abs / - 67" una expresion matematica que contenga alguno de estos elementos: NUMBER, ADD, SUB, MUL, DIV, ABS y EOL. En la consola de comandos usar "./punto4 archivo.txt" siendo "archivo.txt" el txt donde se encuenta la cadena de caracteres para poder usar el codigo

#Punto 5

Para ejecutar el problema 5 en cual consiste en un programa que identifique numeros enteros, imaginarios y complejos en sus dos formas (rectangular y polar) , se debe crear el archivo tipo nano .l donde este tendra todas las reglas y funciones que ejecutara el archivo C, luego al ejecutarlo, cuando el ususario ingrese un numero identifica cual de las tres formas es.
nano punto5.l -> abre archivo de texto tipo nano,
flex punto5.l -> crea un archivo tipo C,
gcc -o punto5 lx.yy.c -lfl -lm -> correra el archivo C generado por el archivo flex,
./punto5 -> permite ejecutar y abrira la consola para su uso
