//// Test 23: Using an unknown token inside an asm function
// Expecting a compile error because "FOO" is not recognized as a valid TVM instruction or primitive.
asm fun testInvalidToken(): Int { FOO }

fun main() {
    testInvalidToken();
}
