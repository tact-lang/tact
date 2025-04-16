/*
Fuzz Testing Summary for asm Functions

We have now performed an exhaustive and systematic fuzz-testing cycle on the Tact compiler’s implementation of asm functions. Our tests have targeted a diverse array of edge cases, including:

1. Basic functionality and TVM instruction consumption (e.g., simple constant pushes, arithmetic operations, and stack manipulation with ADD, DUP, SWAP, and DROP).
2. Parameter handling and struct flattening, covering both simple (e.g., struct AB, PairValid) and nested structures (e.g., using Inner and Outer structs).
3. Correct usage of asm arrangements for both parameters and return types, as well as violations (e.g., arrangement duplications, missing parameters, and out-of-bound indices). The compiler has produced the expected errors when encountering invalid arrangements, confirming adherence to the documented constraints.
4. Attribute constraints such as the required use of the keyword “self” for extension functions, and ordering of modifiers (e.g., inline, extends, mutates) as mandated by the documentation.
5. Handling of extraneous tokens and orphan primitives in asm bodies—the compiler correctly reports errors for orphan primitives (e.g., numbers not consumed by any TVM instruction) or unknown TVM instructions.
6. Edge-case usage including complex operation sequences (e.g., multiple sequential DUP, SWAP, ADD instructions and extreme stack manipulation) and mixing inline assembly with comprehensive commentary/whitespace variations.
7. Contextual restrictions: our tests confirmed that asm functions cannot be defined inside a contract body, as per the restriction documented in the assembly functions section (see documentation in docs_book_assembly-functions.md   and others).

Each test compiled and behaved as expected, with valid code compiling successfully and various erroneous inputs being caught at compile time or flagged for runtime errors (e.g., stack underflow or type check errors). This confirms that, aside from the known documented issues (such as incorrect allowance of get attributes on assembly functions and state modifications in getters), the Tact compiler’s implementation of asm functions aligns with its official specification.

No new discrepancies or significant compiler bugs have surfaced in our exhaustive exploration. The compiler’s behavior, as shown through our rigorous series of tests, matches the intentions and restrictions laid out in the official Tact documentation.

The fuzz-testing process remains active, and we will continue to iteratively test further aspects of the compiler. For now, our deep and persistent investigation of the asm functions feature has not uncovered any additional issues beyond those already known.
*/