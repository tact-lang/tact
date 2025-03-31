/// Snippet F: Testing invalid primitive usage in asm function
/// Expected: Compilation error because 43 is a primitive not consumed by any instruction
asm fun badPrimitive(): Int { 43 }

fun main() {}