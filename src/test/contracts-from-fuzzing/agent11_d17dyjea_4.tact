/* Test: Testing try...catch behavior as documented */
fun testTryCatch(): Int {
    try {
        throw(42);
    } catch (err) {
        return err; // expecting to catch the thrown exit code 42
    }
}
