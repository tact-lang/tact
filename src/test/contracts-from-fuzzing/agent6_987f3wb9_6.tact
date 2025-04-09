/// Test snippet: Using an asm function that incorrectly references its parameter by name.
/// According to the documentation, parameters in asm functions cannot be directly referenced,
/// and doing so should result in a compilation error because the parameter is interpreted as a TVM instruction.

asm fun fail(b: Int): Int { b }

fun main() : Int {
    return fail(10);
}
