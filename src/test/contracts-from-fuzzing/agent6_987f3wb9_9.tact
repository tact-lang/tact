/// Test snippet for direct parameter reference in asm function
/// According to the documentation, parameters in asm functions cannot be directly referenced in the body.

asm fun directParamUse(x: Int): Int { x }
