/// Snippet 5: Testing non-consuming primitive without a consuming instruction
/// Expected behavior: Compilation error because primitive 43 is not followed by a TVM instruction
asm fun nonConsuming(): Int { 43 }

fun main() {
    let _ = nonConsuming();
}
