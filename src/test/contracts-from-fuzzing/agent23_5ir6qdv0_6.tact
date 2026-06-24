/* Test 6: Direct parameter access in asm function body
   Expect a compilation error because parameters should not be directly referenced as TVM instruction mnemonic */
asm fun badParamAccess(x: Int): Int { x }

fun testBadParamAccess(): Int {
    return badParamAccess(123);
}
