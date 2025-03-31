// Final summary of our fuzz-testing cycle for asm functions in Tact

/*
Our comprehensive fuzz-testing cycle for the asm functions feature in Tact has produced the following findings:

1. Basic usage: A minimal asm function that pushes a literal using a valid TVM instruction (e.g., "42 PUSHINT") compiles successfully.

2. Lone primitive error: An asm function that includes a solitary numeric primitive (e.g., "43" without a consuming instruction) is correctly rejected by the compiler.

3. Return arrangements: Our swapInts test (using "asm(-> 1 0)") demonstrates that return arrangements properly reorder multiple values on the stack. Notably, when a function has a single return value, the allowed return arrangement index is strictly 0 – any attempt to use any other index (for instance "asm(c self -> 1 0)" in a function returning a single value) produces a precise compilation error. Although logical, this constraint might merit clearer documentation.

4. Parameter flattening: Struct parameters are correctly flattened onto the stack (as verified by tests such as sumAB and addNested), conforming to documentation specifications regarding the ordering of fields and nested structures.

5. Parameter misuse: Referencing a parameter by name directly in an asm function’s body (instead of using it solely as an argument that is rearranged) is correctly flagged as an error, aligning with expectations.

6. Case sensitivity: TVM instructions must be in UPPER CASE – explicitly testing with a lower-case variant ("pushint") results in a compilation error as required.

7. Quoted instructions: When a TVM instruction is enclosed in quotes, it is treated as a string literal rather than an opcode, confirming the need to use bare identifiers for instructions.

8. Inline attribute: An attempt to use the inline keyword with an asm function (despite asm functions being intrinsically inlined) is rejected by the compiler; this aligns with the language design.

9. Mutation attribute: The use of the "mutates" attribute in assembly functions (which consumes an extra stack value for self) is handled correctly, as confirmed by our loadMyRef test.

10. Additional tests: Combining various TVM instructions (DEPTH, SWAP, DROP, arithmetic operations) verifies that the overall stack-based execution and manipulation matches the documented behavior.

Overall, our systematic investigation confirms that the Tact compiler’s behavior for asm functions is in line with the official documentation. The one subtle nuance regarding return arrangement indices for single-value returns, while logically sound, could benefit from extra documentation clarity. 

No significant compiler bug or explicit documentation mismatch has been uncovered in this testing cycle.

Future cycles will extend our exploration to additional features of the Tact language.
*/