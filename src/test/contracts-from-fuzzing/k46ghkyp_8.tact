fun getTimeFromNow(offset: Int): Int {
    return now() + offset;
}

fun testBasics() {
    // Testing variable declarations inside a function
    let value: Int = 123;       // full declaration with explicit type
    let vInferred = 123;        // type inferred as Int

    // Using context() function to obtain a Context structure
    let vExplicitCtx: Context = context();
    let vCtx = context();

    // Testing a block statement with a let inside a block
    {
        let blockValue = 2 + 2;
        dump(blockValue);
    }
}
