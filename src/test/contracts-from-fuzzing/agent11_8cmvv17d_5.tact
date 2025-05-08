fun testLog() {
    // Valid usage: log of 1000 to base 10 should be 3, rounding down
    dump(log(1000, 10));

    // Invalid usage: num is 0, should throw with exit code 5 (Integer out of expected range)
    try {
        dump(log(0, 10));
    } catch (e) {
        dump(e);
    }
}

fun main() {
    testLog();
}
