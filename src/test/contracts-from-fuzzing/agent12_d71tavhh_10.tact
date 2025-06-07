// Test 5: Comparison - using a primitive with a consuming instruction
// This should compile successfully, using 43 as an argument to PUSHINT
asm fun goodPrimitive(): Int { 43 PUSHINT }

fun main() {
    let a: Int = goodPrimitive();
}
