/// Test 1: Invalid usage of primitive without instruction
// This should fail because the primitive 43 is not attached to any TVM instruction
asm fun bad(): Int { 43 }

fun main() {
    bad();
}
