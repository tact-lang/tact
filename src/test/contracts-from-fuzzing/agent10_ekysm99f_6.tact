// Test 4: Invalid asm function with primitive not used by any TVM instruction
// According to documentation, this should produce a compilation error, as the primitive (43) is not consumed by an instruction.
asm fun badFunc(): Int { 43 }

fun main() {
    badFunc();
}
