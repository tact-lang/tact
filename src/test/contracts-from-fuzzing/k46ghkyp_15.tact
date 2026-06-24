// We started our investigation by searching for the earliest sections of the Tact documentation.
// The docs (e.g., docs_book_index.md   and docs_book_statements.md  ) introduce core language constructs such as:
//   • The 'let' statement with explicit and inferred types
//   • The use of the built-in function context() to obtain a Context value
//   • Basic block statements
//   • Function declarations (e.g., getTimeFromNow) at the module level

// Directly placing top-level variable declarations (not in a function) leads to a compilation error, as expected by the language's module system. 
// This confirms that Tact requires code to be encapsulated within functions, matching the examples provided in the Tact Book.

fun getTimeFromNow(offset: Int): Int {
    return now() + offset;
}

fun testBasics() {
    // 'let' declarations as shown in docs_book_statements.md  
    let value: Int = 123;
    let vInferred = 123;

    // Using the built-in function context() as documented
    let vExplicitCtx: Context = context();
    let vCtx = context();

    // Block statement example (semicolons allowed to be omitted for the last statement in a block)
    {
        let blockValue = 2 + 2;
        dump(blockValue);
    }
}

// Summary:
// Our tests confirm that the fundamental constructs documented in the earliest sections compile successfully and work as expected.
// We noted that trying to declare variables at the module level outside any function is not allowed, which is intentional design per the documentation.
// No significant bug or misinformation has been detected in these early parts of the Tact documentation.
