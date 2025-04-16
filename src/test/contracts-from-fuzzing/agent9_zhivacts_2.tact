/* Test 1: Basic asm function returning literal using TVM instruction */
asm fun answer(): Int { 42 PUSHINT }

fun test1() {
    let a = answer();
}
