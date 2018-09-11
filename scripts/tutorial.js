"use strict"
// script ist jetzt "modern"
// alert( 'This is a LOGIN' );

// TOPIC : VARIABLES

// Definition:
let message;
let camelCaseVariables234;
message = "Hello!";
message = camelCaseVariables234;
/*
Beschreibung:
- Variablen sind case sensitive
- müssen erst "initialisiert werden!"

- Constants - unchangeable variables
const myBirthday = '22.02.1992'
*/

// DATA TYPES
/*
number      : for numbers of any kind: integer or floating-point.
string      : for strings. A string may have one or more characters, there’s no separate single-character type.
boolean     : for true/false.
null        : for unknown values – a standalone type that has a single value null.
undefined   :  for unassigned values – a standalone type that has a single value undefined.
object      : for more complex data structures.
symbol      : for unique identifiers.
*/

// OPERATORS
// remainder (rest)
//alert( 5 % 2 ); // 1 is a remainder of 5 divided by 2
//alert( 8 % 3 ); // 2 is a remainder of 8 divided by 3
//alert( 6 % 3 ); // 0 is a remainder of 6 divided by 3
// exponentiation
//alert( 2 ** 2 ); // 4  (2 * 2)
//alert( 2 ** 3 ); // 8  (2 * 2 * 2)
//alert( 2 ** 4 ); // 16 (2 * 2 * 2 * 2)

// bitwise:
//AND ( & )
//OR ( | )
//XOR ( ^ )
//NOT ( ~ )
//LEFT SHIFT ( << )
//RIGHT SHIFT ( >> )
//ZERO-FILL RIGHT SHIFT ( >>> )

// Interatction
// prompt:
//let age = prompt('How old are you?', 100);
//alert(`You are ${age} years old!`); // You are 100 years old!

//confirm
//let isBoss = confirm("Are you the boss?");
//alert( isBoss ); // true if OK is pressed

//let value = prompt('Zahl ueber 400','')
//if(value > 400) {
//    alert('yays')
//}

// vergleiche:
//let accessAllowed = (age > 18) ? true : false;

// for / while / switch:
/*
let a = 2 + 2;

switch (a) {
  case 3:
    alert( 'Too small' );
    break;
  case 4:
    alert( 'Exactly!' );
    break;
  case 5:
    alert( 'Too large' );
    break;
  default:
    alert( "I don't know such values" );
}
*/