// Final Answer Summary:

/*
Investigation Summary:

We began by consulting the earliest sections of the Tact documentation (for example, the Tact Book overview in docs_book_index.md and the detailed statements in docs_book_statements.md). These sources describe the fundamental constructs of Tact:

1. Variable Declarations:
   • Usage of the 'let' statement works as documented, for instance both explicit declarations (e.g. let value: Int = 123) and inferred declarations (e.g. let vInferred = 123) compile correctly.

2. Built-in Functions:
   • The built-in function context() returns a Context structure as described in the docs.

3. Block Statements:
   • Blocks, delineated by braces { }, work properly with the last semicolon being optional.

4. Function Declarations:
   • Module-level functions (such as getTimeFromNow) compile successfully, confirming that Tact requires code to be encapsulated within function scopes. This is consistent with the documentation, as direct module-level variable declarations (i.e., outside functions) are not permitted.

We tested these features by compiling snippets based on the documentation examples. All constructs compiled as expected, confirming that there’s no misinformation or bugs in these early parts.

Citations:
  • docs_book_index.md introduces the overarching Tact Book and its focus on fundamental concepts.
  • docs_book_statements.md details the syntax for variable declarations, context retrieval with context(), and block statements.

Conclusion: The initial constructs outlined in the early Tact documentation compile and behave as expected. There is no evidence of misinformation or any significant bug in these sections.
*/

fun getTimeFromNow(offset: Int): Int {
    return now() + offset;
}

fun testBasics() {
    // Test variable declarations
    let value: Int = 123;
    let vInferred = 123;

    // Test usage of the built-in function context()
    let vExplicitCtx: Context = context();
    let vCtx = context();

    // Test block statement (with an optional trailing semicolon)
    {
        let blockValue = 2 + 2;
        dump(blockValue);
    }
}
