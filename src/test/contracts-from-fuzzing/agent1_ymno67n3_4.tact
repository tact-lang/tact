/* Test 4: Using a parameter directly in the body, expected to be misinterpreted as TVM instruction
   Should lead to a compilation error, as documented. */

asm fun identity(x: Int): Int { x }

fun testIdentity(): Int {
    return identity(123);
}
