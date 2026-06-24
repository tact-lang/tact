/// Snippet 8: Assembly function with no return type
/// Behavior: The function pushes a value onto the stack but doesn't capture it as a return
asm fun noReturn(x: Int) { 42 PUSHINT }

fun main() {
    noReturn(100);
}
