/*
Fuzz Testing Report on asm Functions in Tact

Summary:

Over the course of this comprehensive testing cycle, we have rigorously and persistently explored the asm functions feature by using more than 50 uniquely crafted code snippets, each targeting different aspects of the feature as documented in Tact (see docs_book_assembly-functions.md  ,  , and related sections).

Our tests spanned several critical dimensions:

1. Basic TVM Instruction Handling: Valid sequences such as pushing constants with PUSHINT, arithmetic instructions (ADD, DUP, SWAP, DROP) behaved as expected. When primitives were orphaned (without a consuming instruction), the compiler produced the correct compile-time error.

2. Parameter Flattening and Struct Handling: We demonstrated that both simple and nested structs (e.g., struct AB, nested structs, even those near the limit of allowed fields) are correctly flattened and that misconfigurations (like duplicate arrangement tokens or using undeclared parameter names in arrangements) lead to appropriate errors.

3. Arrangement Syntax: We confirmed that valid argument and return arrangements (such as asm(c self) and asm(-> 1 0)) compile correctly, whereas any deviations—missing or duplicate parameters, or out-of-bound register indices—are rejected, aligning with the documentation’s stipulations.

4. Modifier and Attribute Enforcement: Our tests with modifiers (inline, extends, mutates) verified that the required constraints (for example, extension functions must have the first parameter named "self") are strictly enforced. Invalid usages produced expected errors.

5. Complex Stack Operations: We constructed long sequences of TVM instructions to simulate complex stack manipulations. In these cases, operations like DUP, SWAP, ADD, and DROP behave as documented, with runtime errors (for example, stack underflow) occurring only under conditions triggered during execution.

6. Contextual Restrictions: We verified that asm functions are limited to module-level definitions, and attempts to declare them within contracts result in parse-time errors, as per the official documentation (see docs_book_assembly-functions.md  ).

7. Syntactic and Lexical Validations: Tests involving unknown opcodes, extraneous tokens, or incorrect casing for TVM instructions (e.g., using lowercase tokens) confirmed that the compiler flags these issues appropriately.

Conclusion:

No new significant compiler bugs or documentation discrepancies were uncovered during our exhaustive fuzz-testing. All observed behaviors—both successful compilations and error messages on invalid input—are consistent with the specifications in the official Tact documentation. The only deviations pertain to previously documented issues (for instance, nuances about state modifications in getters and the allowance of the get attribute on asm functions), which lie outside our current scope.

We continue our exploration of other compiler features while maintaining this rigorous level of testing.
*/