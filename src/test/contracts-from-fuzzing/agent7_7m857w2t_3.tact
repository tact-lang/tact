/* Test snippet: asm function with a primitive not consumed by any TVM instruction. Expected to produce an error. */

asm fun bad(): Int { 43 }

fun main() {
    // This function is not expected to run.
    bad();
}
