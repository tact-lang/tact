/// Test 9: Testing TVM instruction alias "INT" instead of "PUSHINT"
asm fun aliasTest(): Int { 42 INT }

fun test_aliasTest(): Int {
    return aliasTest();
}
