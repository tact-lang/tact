// Final Summary of Investigation

/*
Investigation Summary:

We began by reviewing the early sections of the Tact documentation (see docs_book_index.md and docs_book_statements.md) which introduce key language concepts:

1. Variable Declarations: The 'let' statement works as documented, supporting explicit type annotations (e.g., let value: Int = 123) and type inference (e.g., let vInferred = 123).

2. Built-in Functions: The context() function returns a Context structure, as demonstrated in the documentation.

3. Block Statements: Blocks, delimited by { } with an optional trailing semicolon, are handled as described in the docs.

4. Function Declarations: Functions declared at the module level (e.g., getTimeFromNow) compile correctly, confirming that all Tact code must reside within functions. Top-level variable declarations are not allowed outside of functions, which aligns with the design of the language.

Our testing through compile_snippet confirmed these points:

- Variable declarations, context retrieval, and block syntax compile successfully when encapsulated in function scope.
- Module-level function definitions compile as expected.

Conclusion: The foundational constructs described in the early parts of the Tact documentation are correct, and our tests reveal no misinformation or bugs.
*/

fun getTimeFromNow(offset: Int): Int {
    return now() + offset;
}

fun testBasics() {
    // Testing explicit and inferred let declarations
    let value: Int = 123;
    let vInferred = 123;

    // Testing context() as documented
    let vExplicitCtx: Context = context();
    let vCtx = context();

    // Testing block statement with optional trailing semicolon
    {
        let blockValue = 2 + 2;
        dump(blockValue);
    }
}
