/// Additional Edge Cases Testing for ASM Functions in Tact

// Test A: Attempt to reference a parameter name in the assembly function body
// According to documentation, parameters in asm functions cannot be directly referenced in the body, as they are interpreted as TVM instructions.
// Expected: Compilation error, similar to the error for "bocchiThe" in the documentation snippet.
asm fun refParam(x: Int): Int { x }
