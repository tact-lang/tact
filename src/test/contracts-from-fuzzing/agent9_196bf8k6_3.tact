fun mightThrow(flag: Bool): Int {
    if (flag) {
        throw(3);
    }
    return 100;
}

fun testTryConditional(flag: Bool): Int {
    try {
        let res: Int = mightThrow(flag);
        return res;
    } catch (e) {
        return e;
    }
}

// main function to call testTryConditional
fun main() {
    testTryConditional(true);
    testTryConditional(false);
}
