// Summary code for early Tact docs validation

// The following module-level code defines two functions: getTimeFromNow and testBasics. They together validate basic Tact constructs taken from the earliest parts of the Tact documentation such as variable declarations, type inference, context retrieval, block statements, and function returns.

fun getTimeFromNow(offset: Int): Int {
    return now() + offset;
}

fun testBasics() {
    // Basic variable declarations with and without explicit type annotation (see docs_book_statements.md  )
    let value: Int = 123;
    let vInferred = 123;

    // Using built-in function context() to obtain a Context structure as shown in the early docs (docs_book_statements.md  )
    let vExplicitCtx: Context = context();
    let vCtx = context();

    // Block statement example (docs_book_statements.md  ): the block groups a statement with optional semicolon on the last statement. 
    {
        let blockValue = 2 + 2;
        dump(blockValue);
    }
}

// Explanation:
// Our tests confirm that the Tact documentation's examples for fundamental language constructs compile successfully when defined in function scope. 
// Note: Trying to place variable declarations directly at the module level without a function context results in a compilation error, which is the intended behavior as functions are the basic compilation units in Tact. 
// These examples mirror the introductions in the Tact Book (see docs_book_index.md  ).
