/// Snippet: illegalParam
/// This asm function incorrectly attempts to use a parameter name directly in its body, which should be interpreted as invocation of a TVM instruction but fail.

asm fun illegalParam(x: Int): Int { x }

fun main() {}