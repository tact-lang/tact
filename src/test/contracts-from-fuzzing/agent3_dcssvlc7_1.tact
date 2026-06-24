fun testTryCatch() {
    try {
        throw(1042);
    } catch (e) {
        dump(e);
    }
}

// A main function to allow this snippet to compile
fun main() {
    testTryCatch();
}
