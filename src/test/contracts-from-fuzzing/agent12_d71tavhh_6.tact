// Test 3: Attempting to use a primitive without a consuming TVM instruction (expected to fail)
asm fun badPrimitive(): Int { 43 }

fun main() {
    badPrimitive();
}
