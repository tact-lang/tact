/* Comprehensive Summary of ASM Functions Testing in Tact

This test suite was designed to thoroughly explore the asm functions feature in Tact as documented in multiple sections (e.g., docs_book_assembly-functions.md  ,  ,  ).

Our approach was to validate documented claims and edge cases in the following areas:

1. Basic asm function behavior with TVM instructions (Test 1):
   - We defined a simple asm function using the literal (42) combined with the PUSHINT instruction. Compilation succeeded as documented.

2. Struct parameter flattening (Test 2):
   - We used a struct (Pair) parameter that gets flattened into the stack (fields a and b) and then used the ADD instruction to compute their sum. The behavior was consistent with documentation (see   for similar examples).

3. Disallowed usage of standalone primitive values (Test 3):
   - An asm function was defined with an isolated literal (43) without an associated TVM instruction. The compiler properly produced a compilation error as expected.

4. Improper usage of parameter identifiers (Test 4):
   - The asm function attempted to directly reference a parameter (x) in its body. The compiler interpreted it as a TVM instruction and yielded a compilation error, which corroborates the documentation that parameters must not be directly used.

5. Return arrangement for swapping values (Test 5):
   - Using a return arrangement (-> 1 0), we implemented a function that swaps the top two stack values. Successful compilation verified the documented return arrangement behavior.

6. Combined argument and return arrangements (Test 6):
   - We specified an arrangement (`asm(b a -> 1 0)`) to reorder both argument pushing and return capture. The function compiled successfully, confirming that both aspects are supported as per documentation.

7. TVM ‘DEPTH’ instruction usage (Test 7):
   - An assembly function was defined to capture the current stack depth using DEPTH. Compilation was successful and behavior met our expectations per documentation.

8. Context for asm functions placement (Test 8):
   - Defining an asm function within a contract led to a compilation error, as asm functions must be defined at the module level. This aligns with the documented restrictions.

9. Allowed use of attributes (Test 9):
   - An asm function with both `extends` and `mutates` was accepted by the compiler, matching the guidance in the documentation.

10. Incorrect argument arrangement (Test 10):
    - We attempted an incorrect arrangement that did not include all parameters. The result was a compilation error, as expected and documented.

11. Presence of forbidden statements (Test 11):
    - Attempts to include Tact statements (e.g., let declarations) inside asm functions resulted in compilation errors—confirming that only TVM instructions and primitives are permitted.

12. Nested struct flattening (Test 12):
    - A more complex scenario involving nested structs validated that assembly functions correctly flatten nested structures in a right-to-left manner (see   for reference). Compilation succeeded, confirming documented behavior.

Conclusion:
All tests confirmed that the Tact compiler behavior for asm functions is consistent with the official Tact documentation regarding arrangements, permitted syntax, and restrictions. In every case, permitted constructs compiled successfully, and disallowed constructs produced the expected compilation errors. No discrepancies or unexpected behaviors were discovered beyond the known issues.
*/