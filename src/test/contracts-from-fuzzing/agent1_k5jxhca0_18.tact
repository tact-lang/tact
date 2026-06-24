// Final summary of our fuzz-testing cycle for asm functions

/*
Our systematic and comprehensive testing of the asm functions feature in the Tact language has yielded the following observations:

1. Basic asm functions work correctly: e.g., "asm fun answer(): Int { 42 PUSHINT }" compiles successfully.

2. Primitives that are not immediately consumed by a TVM instruction are correctly rejected (e.g., "asm fun bad(): Int { 43 }").

3. Return arrangements (such as in the function swapInts) work as intended when the correct number of return values are produced. In particular, for functions returning a single value, the only valid return position is 0 (as evidenced by the error in Test 12: "asm return rearrangement must mention only valid return position numbers: [0..0]"), which aligns with the expectation that a single-value return type enforces a strict stack order. Although not explicitly detailed in the documentation, this behavior is logical.

4. Parameter flattening for struct parameters operates as documented. The function sumAB and nested structure tests compile and use the flattened parameter lists correctly.

5. If a parameter name appears in the asm body (as in Test 5) instead of a valid TVM instruction, the compiler correctly flags an error.

6. TVM instructions are case-sensitive, and errors are correctly produced if an instruction (such as "pushint") is written in lower case.

7. Quoted TVM instructions (Test 7) are treated as string literals, which does not trigger the intended opcode behavior.

8. The inline attribute is not allowed to be prefixed as expected, and the compiler rightly rejects "inline asm fun ..." as asm functions are always inlined.

9. Mutation asm functions (with the "mutates" attribute) correctly account for the extra value consumption from the stack, as shown in our loadMyRef test.

10. Lastly, tests involving multiple TVM instructions (e.g., multiOps, pushImmediate, pushNegative) and explicit use of stack registers (s0 in explicitStackRef) produce outputs or errors as expected, confirming the documented behavior.

Overall, all our tests largely comport with the official Tact documentation. The one subtle point we identified is the strict constraint on return arrangement indices for single-value functions (only "0" is allowed), which, while logical, might benefit from clearer documentation. At this time, no significant compiler bug or documentation mismatch has been detected.

We will continue our fuzz-testing exercises to further challenge other features in future cycles.

References:
- Assembly functions and TVM instructions:  ,  ,  
- Parameter and return flattening:  
- Case sensitivity and usage rules:  
*/