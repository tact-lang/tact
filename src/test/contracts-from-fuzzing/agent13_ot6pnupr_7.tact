// Test A: asm function with a primitive that is not consumed by any instruction
// Expected: Compilation error because the primitive '43' is not used as an argument to any TVM instruction
asm fun bad(): Int { 43 }

fun main() {
    bad();
}
