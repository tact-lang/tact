// Test 6: Testing case sensitivity (should produce a compilation error)
// Using TVM instruction in lowercase, which should result in a compilation error since TVM instructions must be uppercase
asm fun badCase(): Cell { mycode }

fun main() {
    badCase();
}
