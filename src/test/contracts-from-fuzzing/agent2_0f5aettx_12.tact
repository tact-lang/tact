/* Test 35: Increment test using arithmetic addition to simulate increment
   This function should add 42 and 1, returning 43
*/
asm fun incTest(): Int { 42 PUSHINT 1 PUSHINT ADD }

/* Test 36: Attempt to access an out-of-range stack register (s256 is invalid, valid range: s0..s255) - expected error */
asm fun outOfRange(): Int { s256 }

/* Test 37: Valid asm function returning a struct using a proper arrangement
   Define a struct with one field and use arrangement to capture the value
*/
struct One { a: Int }
asm(-> 0) fun oneReturn(): One { 99 PUSHINT }

/* Test 39: Testing nested struct flattening with potential ambiguity in field names
   Define struct A and struct B where B has a nested struct A and an additional field x
   Flattening should order: b.a.x, then b.x, and using ADD should sum these two values
*/
struct A { x: Int }
struct B { a: A; x: Int }
asm fun testAmbiguity(b: B): Int { ADD }