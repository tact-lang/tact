fun testNullAssert() {
    let x: Int? = null;
    try {
        // Attempt to enforce non-null, which will fail
        dump(x!!);
    } catch (exitCode) {
        // Dump the exit code; per documentation, should be 128 (Null reference exception)
        dump(exitCode);
    }
}

fun runTest() {
    testNullAssert();
}
