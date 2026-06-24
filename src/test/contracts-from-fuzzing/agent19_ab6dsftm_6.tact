fun testTryCatch() : Int {
    try {
        return 42;
    } catch (err) {
        // err is the exit code
        return err;
    }
}

fun main() : Int {
    return testTryCatch();
}
