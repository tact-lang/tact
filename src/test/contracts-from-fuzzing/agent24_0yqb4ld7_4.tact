/* Test 1: Simple addition using asm function */
asm fun add(a: Int, b: Int): Int { ADD }

fun test_add(): Int {
    // This should add 10 and 20, expecting the result 30 to be returned from the stack
    return add(10, 20);
}
