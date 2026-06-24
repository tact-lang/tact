/// Test 13: Using multiple TVM instructions in asm function to double a value
// Expected: double(21) should return 42 since it duplicates the input and adds
asm fun double(x: Int): Int { DUP ADD }

fun main() {
    let result = double(21);
}
