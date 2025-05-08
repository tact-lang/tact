/// Snippet: testParam
/// This asm function attempts to use a parameter name in its body as part of TVM instruction sequence.
/// According to the documentation, direct references to parameters in asm function bodies are interpreted as TVM instructions.

asm fun testParam(x: Int): Int { x PUSHINT }

fun main() {}