/* Test 4: Misuse of parameter reference inside asm function
   Attempt to directly reference a parameter inside an asm function body.
   According to the docs, this should be treated as a TVM instruction and likely result in a compilation error.
*/

asm fun identity(x: Int): Int { x }