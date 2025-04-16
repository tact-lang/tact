// Summary of current fuzz-testing outcomes for asm functions

// NOTE: Our current testing cycle has executed numerous representative scenarios for asm functions without detecting a catastrophic deviation from documented behavior. Below is a summary of key outcomes:

// 1. Basic asm function (answer):
//    -> asm fun answer(): Int { 42 PUSHINT } compiled successfully, as expected.

// 2. TVM instruction case sensitivity (wrongCase):
//    -> asm fun wrongCase(): Cell { mycode } raised a compilation error due to non-uppercase instruction, confirming documented case-sensitivity.

// 3. Primitive without an immediate consuming instruction (primitiveAlone):
//    -> asm fun primitiveAlone(): Int { 43 } raised a compilation error as expected.

// 4. Parameter usage as TVM instruction (identity):
//    -> asm fun identity(x: Int): Int { x } produced an error because the parameter name "x" is interpreted as a TVM instruction, per documentation.

// 5. Argument arrangement (asmStoreDict):
//    -> asm(c self) extends fun asmStoreDict(self: Builder, c: Cell?): Builder { STDICT } compiles successfully, following documentation.

// 6. Return arrangement and swapping (swapReturn):
//    -> Using a struct Pair and return arrangement "(-> 1 0)" compiled successfully: asm fun swapReturn(): Pair { 5 PUSHINT 10 PUSHINT } swaps two pushed values.

// 7. Excessive DROP causing underflow (dropTooMany):
//    -> asm fun dropTooMany(): Int { DROP DROP } compiles, but may cause runtime underflow if executed; compiler enforces stack conditions as expected.

// 8. "mutates" attribute with type mismatch (loadRefMismatch):
//    -> asm(-> 1 0) extends mutates fun loadRefMismatch(self: Slice): Int { LDREF } compiled, but is expected to fail at runtime with type check error if the consumed type does not match. (This test confirms documented behavior.)

// 9. Nested struct flattening (sumAB):
//    -> asm fun sumAB(two: AB): Int { ADD } compiled, validating the flattening behavior of structs.

// 10. Multiple TVM instructions in sequence (multiStep):
//    -> asm fun multiStep(): Int { 5 PUSHINT 3 PUSHINT ADD } compiled successfully and executed instructions in proper order.

// 11. Using inline attribute (inlineTest) and literal encoding (push42):
//    -> Both asm inline fun inlineTest(): Int { 7 PUSHINT } and asm fun push42(): Int { 42 PUSHINT } compile as expected.

// 12. Testing arrangements for loading integer with proper struct signature (asmLoadInt):
//    -> Compiled successfully, demonstrating proper readjustment of TVM stack ordering via arrangement syntax.

// 13. Additional tests for excessive DROP, negative literal boundary, immediate range value, and complexStackOp:
//    -> asm fun excessiveDrop(): Int { DROP DROP DROP }, asm fun pushNeg5(): Int { -5 PUSHINT }, and asm fun push15(): Int { 15 PUSHINT } compile as expected.
//    -> asm fun complexStackOp(): Int { ... } compiled successfully, chaining multiple operations.

// 14. Additional tests for spaced instructions, stack depth checking (checkDepth), and minimal valid function:
//    -> asm fun spacedInstructions(): Int {  1 PUSHINT    2 PUSHINT   ADD   } and asm fun checkDepth(): Int { DEPTH DROP } compile successfully.
//    -> asm fun minimalValid(): Int { 0 PUSHINT } compiles successfully.

// Our comprehensive testing of asm functions, designed to exercise subtle cases (arrangements, ordering of TVM instructions, parameter flattening, case-sensitivity, and improper usage) has not yet revealed a significant compiler bug or documentation mismatch beyond what is already documented in known issues.

// We now continue with further testing permutations and edge cases within the asm functions domain to maintain our rigorous fuzzing process.

// 25. Further Edge Case: Using a numeric literal near encoding boundaries in a more complex context
asm fun pushBoundary(): Int {
    10 PUSHINT   // inside small immediate range
    11 PUSHINT   // might need a larger encoding
    ADD
}

// 26. Edge Case: Combine multiple TVM instructions with unusual spacing and newlines
asm fun messyFormatting(): Int {
    20  PUSHINT
    
    30     PUSHINT
    ADD
}

// 27. Edge Case: Assembly function with extra whitespace in arrangement declaration
struct SliceInt2 { s: Slice; val: Int }
asm(  s   len  ->  1   0  ) fun asmLoadIntMessy(len: Int, s: Slice): SliceInt2 { LDIX }

// 28. Edge Case: Assembly function with duplicate TVM instructions
asm fun duplicateInstructions(): Int {
    5 PUSHINT
    5 PUSHINT
    ADD
    ADD   // extra ADD, should cause stack underflow if not enough values are on the stack
}

// 29. Edge Case: Combining DEPTH with arithmetic operations
asm fun depthArithmetic(): Int {
    DEPTH
    2 PUSHINT
    ADD
}

// 30. Edge Case: An asm function using a non-existent TVM instruction deliberately wrong
asm fun nonExistent(): Int { FOOBAR }
