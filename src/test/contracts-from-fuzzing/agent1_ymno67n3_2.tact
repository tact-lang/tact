/* Test 2: asm fun bad(): Int { 43 } - should produce a compilation error because a primitive is provided without a consuming instruction */

asm fun bad(): Int { 43 }

fun testBad(): Int {
    return bad();
}
