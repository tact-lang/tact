/// Snippet: noReturnTest
/// This asm function has no declared return type, so it does not capture any value from the stack.
asm fun noReturnTest(x: Int) { 42 PUSHINT }

fun main() {
    noReturnTest(5);
}
