// Test 2: Using double quotes around TVM instruction
// This should cause an error, because "PUSHINT" is interpreted as a string, not a TVM instruction
asm fun wrongCode(): Cell { "PUSHINT" }

fun main() {
    let c = wrongCode();
}
