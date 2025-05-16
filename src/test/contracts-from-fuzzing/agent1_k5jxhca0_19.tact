// Final summary of our fuzz-testing cycle for asm functions

/*
Our systematic and comprehensive testing of the asm functions feature in the Tact language has yielded the following observations:

1. Basic asm functions work correctly: e.g., the snippet "asm fun answer(): Int { 42 PUSHINT }" compiled successfully, confirming that TVM instructions (such as PUSHINT) behave as expected.

2. Primitives that are not tied to a consuming operator (e.g., "43" in "asm fun bad(): Int { 43 }") are rightly rejected, which is consistent with the documented requirement that primitives must be used as arguments for subsequent TVM instructions.

3. The support for return arrangements has been validated: in our swapInts function (using the arrangement syntax "asm(-> 1 0)") the order of stack values is manipulated correctly. However, when attempting to use an arrangement in a function with a single return value (as in Test 12 with asmStoreDict), the compiler correctly rejects an attempt to specify return positions other than 0. This indicates that for single-value functions only a single return position (index 0) is valid. Although the documentation explains how arrangements work, it does not emphasize this specific constraint explicitly. 

4. Parameter flattening using structs is implemented as documented: our test with the function sumAB showed that a struct’s fields are pushed onto the stack in order, and subsequent TVM instructions (like ADD) operate on them correctly. Similarly, our nested structures test (addNested) verified that nested struct flattening operates in the expected left-to-right order.

5. Misuse of parameter names: When a parameter name like "x" is used directly in the asm body (Test badParam), it is interpreted as a TVM instruction, which is not valid. The compiler reports an error, in agreement with documentation that direct references to parameters in asm bodies are forbidden.

6. TVM instructions are case-sensitive: our test lowerCase, with "pushint" in lower case, produced a compilation error, emphasizing that TVM instructions must be in upper-case, as specified in the docs [ ].

7. Quoted TVM instructions: our test quotedInstruction revealed that enclosing a TVM instruction in double quotes causes it to be treated as a string literal and not as an opcode, leading to erroneous behavior.

8. The use of the inline attribute with asm functions is unnecessary since asm functions are always inlined; our attempt to use "inline asm fun ..." produced a compilation error, showing that such annotations are not permitted in this context.

9. Mutation asm functions and extra stack consumption: our mutation test loadMyRef showed that when the "mutates" attribute is used, the compiler correctly consumes an extra value from the stack (i.e., self) in line with the documented behavior [ ].

10. Finally, testing various TVM instructions (such as DEPTH, SWAP, DROP, and arithmetic operations) confirmed that sequential and combined operations follow the stack manipulation rules as described in the Tact documentation [ ].

In summary, our comprehensive fuzz-test on asm functions did not reveal any significant compiler bugs or explicit documentation mismatches. One subtle nuance—namely, the fixed return arrangement indices for functions returning a single value—merits further documentation clarification. Nonetheless, the implementation largely adheres to the official specifications. We will continue our exploration of other language features in subsequent testing cycles.
*/
