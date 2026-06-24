/// Test 10b: Inline attribute reordered after asm keyword
asm inline fun inlineTest(): Int { 42 PUSHINT }

fun main() {
    let r = inlineTest();
}
