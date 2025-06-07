/// Test 13: Attempt to explicitly use a stack register (s255) in an asm function.
/// According to documentation, stack registers can be mentioned only in contexts where a TVM instruction expects them.
/// This test checks if the compiler enforces that rule.

asm fun testStack(): Int { s255 }

fun main(): Int {
    return testStack();
}
