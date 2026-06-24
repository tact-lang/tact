/// Test 4: Using double quotes for TVM instruction (should error)
asm fun wrongMyCode(): Cell { "MYCODE" }

fun test_wrongMyCode(): Cell {
    return wrongMyCode();
}
