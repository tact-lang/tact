// Test 3: Test case with reversed TVM instruction case (should fail)
// The docs state that TVM instructions must be uppercase. Here we mix case intentionally.
asm fun mixedCase(): Int {
    42 PuShInT
}

fun main() {
    let x = mixedCase();
}
