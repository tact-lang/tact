/// Test Snippet 6: Using a parameter identifier directly in the asm body
/// Expected: Compilation error because `x` is interpreted as a TVM instruction rather than a reference to the parameter
asm fun badParam(x: Int): Int { x }

fun main() {
    let _ = badParam(10);
}
