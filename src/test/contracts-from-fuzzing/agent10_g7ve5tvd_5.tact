/* Test 5: Nested struct parameter flattening. 
   The struct A is flattened into two Int values on the stack (x then y). 
   The ADD instruction pops both values and pushes their sum. */

struct A { x: Int; y: Int }

asm fun sumA(a: A): Int { ADD }

fun main() {
    let s = sumA(A { x: 15, y: 27 });
}