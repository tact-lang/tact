/// Test 3: Lower-case instruction (should error because TVM instructions are case-sensitive)
asm fun lowerCaseTest(): Int { 42 pushint }

fun test_lowerCase(): Int {
    return lowerCaseTest();
}
