/* Test 7: Empty body in asm function, expected to produce a compilation error */

asm fun emptyBody(): Int {  }

fun testEmpty(): Int {
    return emptyBody();
}
