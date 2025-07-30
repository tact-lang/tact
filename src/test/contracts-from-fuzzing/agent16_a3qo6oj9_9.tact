/// Snippet 9: Testing inline attribute with asm function
asm inline fun inlineTest(): Int { 42 PUSHINT }

fun main() {
    let res = inlineTest();
}
