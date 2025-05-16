/// Test 2: Assembly function with addition using parameter
asm fun addOne(a: Int): Int { 1 PUSHINT ADD }

fun test_addOne(): Int {
    return addOne(10);
}
