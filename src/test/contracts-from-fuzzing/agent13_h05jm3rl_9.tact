/// Test 6: Assembly function with a primitive but no consuming TVM instruction, should error
asm fun primError(): Int { 43 }

fun test_primError(): Int {
    return primError();
}
