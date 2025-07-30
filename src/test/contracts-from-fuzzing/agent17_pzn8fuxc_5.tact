// Test 1: Basic ASM function
// According to docs, an ASM function body should contain only TVM instructions and primitives.
asm fun answer(): Int { 42 PUSHINT }

// Calling function using standard function syntax (colon between parameters and return type)
fun main(): Int {
    return answer();
}
