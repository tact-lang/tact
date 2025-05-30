fun earlyReturn(x: Int): Int {
    if (x > 0) {
        return x;
    }
    return -x;
}

// Test usage (dummy dump)
fun main() {
    dump(earlyReturn(5));
    dump(earlyReturn(-3));
}