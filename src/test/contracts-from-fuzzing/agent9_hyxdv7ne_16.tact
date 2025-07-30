struct TooMany { f1: Int; f2: Int; f3: Int }

// This assembly function tries to capture three values from the stack, but none are pushed in the body.
// Expected: should compile successfully, but if executed at runtime, a stack underflow (exit code 2) should occur.
asm fun underflowTest(): TooMany { }