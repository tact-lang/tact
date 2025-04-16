/* Test: pushNeg - Testing PUSHINT with a negative number */

asm fun pushNeg(): Int { -1 PUSHINT }

fun testPushNeg(): Int {
    return pushNeg();
}
