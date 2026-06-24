//// Test 25: asm function with 16 parameters to sum them up
// The function consumes 16 integers and returns their sum using 15 ADD operations.
asm fun sum16(a1: Int, a2: Int, a3: Int, a4: Int, a5: Int, a6: Int, a7: Int, a8: Int, a9: Int, a10: Int, a11: Int, a12: Int, a13: Int, a14: Int, a15: Int, a16: Int): Int {
    ADD ADD ADD ADD ADD ADD ADD ADD ADD ADD ADD ADD ADD ADD ADD
}

//// Test 28: asm function without a return type (void asm function)
// This function performs operations but does not capture any resulting stack value.
asm fun voidAsm(x: Int) { DUP DROP }

//// Test 30: asm function pushing borderline literal values
// This function pushes -5, 10, and 11 onto the stack. Then it adds the top two values (10+11=21),
// and then adds the result to -5, yielding 16.
asm fun pushLiterals(): Int { -5 PUSHINT 10 PUSHINT 11 PUSHINT ADD ADD }

fun main() {
    let s16 = sum16(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16);
    voidAsm(42);
    let lit = pushLiterals();
}
