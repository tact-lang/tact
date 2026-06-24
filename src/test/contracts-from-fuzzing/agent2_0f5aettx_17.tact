/* Test 51: asm function with inline comments and newlines in the body - should compile successfully */
asm fun commentTest(): Int {
    10 PUSHINT // push ten
    32 PUSHINT // push thirty-two
    ADD        // add them to get 42
}
