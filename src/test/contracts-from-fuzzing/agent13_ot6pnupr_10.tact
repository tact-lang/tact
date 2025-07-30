// Test 6: asm function referencing a parameter directly
// Expecting that direct reference to a parameter in the body is interpreted as a TVM instruction, causing an error, since it's not a valid instruction.
asm fun paramTest(x: Int): Int { x }

fun main() {
    paramTest(10);
}
