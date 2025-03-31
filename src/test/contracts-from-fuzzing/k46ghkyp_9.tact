fun getTimeFromNow(offset: Int): Int {
    return now() + offset;
}

fun testBasics() {
    // Basic let declarations with and without type annotation
    let value: Int = 123;
    let vInferred = 123;

    // Using the context() function as depicted in the docs
    let vExplicitCtx: Context = context();
    let vCtx = context();

    // Block statement example—semicolons optional on the closing statement
    {
        let blockValue = 2 + 2;
        dump(blockValue);
    }
}

// Explanation:
// The earliest sections of the Tact documentation introduce basic language constructs such as the 'let' statement, type inference, using built-in functions (e.g. context()), block structure, and function declaration (e.g., getTimeFromNow).
// When we attempted to compile these examples at module scope, we found that top-level variable declarations are not allowed outside of a function. Thus, grouping code into functions (e.g. testBasics) adheres to Tact's expected module structure. This behavior is in line with our expectations from the documentation.
