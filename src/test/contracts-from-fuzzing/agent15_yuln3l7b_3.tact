// Fuzz testing several asm function edge cases

// 1. Direct reference to a parameter in the asm body (should be error as parameter names are not accessible)
asm fun echo(x: Int): Int { x }

// 2. Use of a Tact statement inside asm body (illegal, as only TVM instructions are allowed)
asm fun illegalBody(): Int { return 42 }

// 3. Using quotes around a TVM instruction (should be error, as it makes it a string)
asm fun wrongQuotes(): Int { "PUSHINT" }

// 4. Lowercase TVM instruction (should be error due to case sensitivity)
asm fun wrongCase(): Int { 42 pushint }

// 5. Excessive return capture: struct with 3 fields but only 1 value pushed (should produce runtime stack underflow)
struct TooMany { a: Int; b: Int; c: Int }
asm fun outTooMany(): TooMany { 42 PUSHINT }

// 6. Primitive provided without a consuming TVM instruction (should be a compilation error)
asm fun missingTVMInstruction(): Int { 42 }