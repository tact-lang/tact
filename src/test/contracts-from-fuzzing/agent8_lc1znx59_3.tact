fun testConditionalTryCatch(x: Int): Int {
    try {
        if (x == 0) { throw(101); }
        return 1;
    } catch (err) {
        return err;
    }
}

fun main() {
    testConditionalTryCatch(0);
    testConditionalTryCatch(10);
}
