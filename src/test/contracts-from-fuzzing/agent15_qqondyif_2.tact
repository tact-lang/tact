fun earlyReturnTest(a: Int): Int {
    if (a > 10) {
        { return a; } // return from nested block
    }
    return 0;
}

fun main() {
    dump(earlyReturnTest(15)); // Expected: 15
    dump(earlyReturnTest(5));  // Expected: 0
}
