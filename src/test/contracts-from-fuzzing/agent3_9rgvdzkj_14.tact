// Test 14: Check error when referencing out-of-range constant in TVM instruction argument. 
// According to the docs, numeric primitives used as arguments for PUSHINT must lie in specific ranges.
// We'll attempt to use a value below -128 (e.g., -130) which should alter the opcode accordingly. 
// We construct an asm function that pushes -130 using PUSHINT and captures it as Int.

asm fun pushNeg130(): Int { -130 PUSHINT }

fun main(): Int {
    return pushNeg130();
}
