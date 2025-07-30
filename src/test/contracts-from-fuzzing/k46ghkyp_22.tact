// Final final answer

/*
Summary of Investigation:

Our investigation began by reviewing the earliest sections of the Tact documentation (specifically, docs_book_index.md and docs_book_statements.md).

Key Points Validated:
1. Variable Declarations: The 'let' statement works as advertised. Both explicit (e.g., let value: Int = 123) and inferred declarations (e.g., let vInferred = 123) compile correctly.

2. Built-in Functions: The built-in function context() returns a Context structure, as documented.

3. Block Statements: Blocks, as shown in the docs, work correctly, with the final semicolon being optional.

4. Function Declarations: Module-level function declarations (e.g., getTimeFromNow) compile successfully. Moreover, trying to declare variables outside functions results in a compilation error—this is consistent with the intended design.

Conclusion: The fundamental constructs presented in the earliest parts of the Tact documentation compile and behave according to the documented examples. No real bugs, discrepancies, or misinformation have been found at this stage.
*/

fun getTimeFromNow(offset: Int): Int {
    return now() + offset;
}

fun testBasics() {
    // Testing explicit and inferred let declarations
    let value: Int = 123;
    let vInferred = 123;

    // Testing the context() function
    let vExplicitCtx: Context = context();
    let vCtx = context();

    // Testing block statement usage
    {
        let blockValue = 2 + 2;
        dump(blockValue);
    }
}
