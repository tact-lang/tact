fun testRepeatReturn(n: Int): Int {
    repeat(n) {
        if (n == 0) {
            return 42;
        }
    }
    return 0;
}

fun main() {
    dump(testRepeatReturn(5));
    dump(testRepeatReturn(0));
}
