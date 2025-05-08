/// Test Snippet: invalidParamRef
// This is expected to cause a compilation error,
// because the parameter 'x' is used directly in the function body,
// which is interpreted as a TVM instruction instead of a parameter reference.

asm fun invalidParamRef(x: Int): Int { x }

fun main() {
    invalidParamRef(10);
}
