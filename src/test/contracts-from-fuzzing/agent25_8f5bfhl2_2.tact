/// Test 2: Testing case sensitivity in asm function: using lower-case TVM instruction should trigger a compile error
asm fun bad1(): Cell { mycode }

fun main() {
    // Intentionally calling bad1 (should not compile successfully)
    bad1();
}
