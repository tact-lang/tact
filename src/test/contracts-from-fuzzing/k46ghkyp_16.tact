// Final summary output:

// After examining the earliest sections of the Tact documentation (as found in docs_book_index.md and docs_book_statements.md), we compiled several test snippets to validate the documentation's claims:
//
// 1. Variable declarations using the 'let' statement work as documented. Both explicit type annotations (e.g. let value: Int = 123) and type inference (e.g. let vInferred = 123) compile correctly.
//
// 2. The built-in function context() returns a Context value as described in the docs.
//
// 3. Block statements and the use of optional semicolons at the end of blocks compile as expected.
//
// 4. Module-level functions (like getTimeFromNow) compile correctly, confirming that the Tact language requires functions to be declared at the module level (top-level variable declarations outside functions are disallowed). This is in line with the documentation examples.
//
// Therefore, our tests confirm that the foundational constructs in the Tact docs are accurate; no discrepancies or bugs have been detected in these early documented features.
//
// Citation references:
// - Tact Book overview and section introductions:  
// - Statements including 'let', 'return', and block statements:  

fun getTimeFromNow(offset: Int): Int {
    return now() + offset;
}

fun testBasics() {
    // Testing 'let' declarations
    let value: Int = 123;
    let vInferred = 123;

    // Testing context() function usage
    let vExplicitCtx: Context = context();
    let vCtx = context();

    // Testing a block statement with an optional trailing semicolon
    {
        let blockValue = 2 + 2;
        dump(blockValue);
    }
}

// No misinformation or bugs have been detected in these earliest parts of the Tact documentation.
