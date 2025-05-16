fun earlyReturn(a: Int): Int {
    if (a > 0) {
        return 1;
    }
    return -1;
}

fun main() {
    dump(earlyReturn(10));
    dump(earlyReturn(-10));
}
