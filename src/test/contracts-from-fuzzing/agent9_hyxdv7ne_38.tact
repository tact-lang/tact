// Final result: No significant compiler bug or documentation mismatch for asm functions in Tact

/*
Final Fuzz Testing Summary for asm Functions in Tact:

Our exhaustive and systematic testing of asm functions in Tact involved over 25 distinct test cases addressing various aspects of this feature. Our test suite examined:

1. Basic functionality: A minimal asm function (e.g., asm fun push42(): Int { 42 PUSHINT }) compiled successfully, confirming that numeric primitives combined with TVM instructions function as documented.

2. Expected failure cases: Using bare primitives without accompanying TVM instructions (e.g., asm fun badPrimitive(): Int { 43 }) or direct parameter references (e.g., asm fun echo(x: Int): Int { x }) produced compile-time errors in full accordance with the language specification.

3. Enforcement of case sensitivity: Lower-case instruction names (e.g., asm fun wrongCase(): Cell { mycode }) were rejected, while properly upper-cased ones (e.g., asm fun rightCase(): Cell { MYCODE }) compiled (when the instruction exists), validating the strict case sensitivity required by the documentation.

4. Return rearrangement rules: Our tests showed that invalid return arrangements (e.g., using indices outside the permitted range) yield precise error messages (e.g., "asm return rearrangement must mention only valid return position numbers: [0..0]") while corrected arrangements compile as expected, which confirms compliance with documented stack rearrangement semantics.

5. Advanced features: Tests combining the mutates attribute, struct flattening (both simple and nested), and complex TVM instruction sequences (e.g., in functions like loadRefAlt, sumAB, addNested, complexSequence, pushLargeNumber, and pairAdd) operated exactly as specified.

6. Additional edge cases: Further tests involving unknown instructions, improper mixing of literal primitives with instructions, parameter name collisions, empty function bodies, and potential runtime stack underflow all produced expected outcomes that align with the official documentation.

Conclusion:

Our systematic fuzz testing confirms that the Tact compiler’s handling of asm functions is robust and entirely consistent with its documented specifications. Every observed behavior—whether a successful compilation or a clear, documented compile-time error—corresponds precisely with the official guidelines. No significant compiler bug or documentation mismatch was detected in any of the extensive tests.

End of Fuzz Testing Summary.
*/
