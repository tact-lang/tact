fun earlyReturn(x: Int): Int {
    if (x > 10) {
         return x;
    }
    if (x < 0) {
         return -x;
    }
    return 0;
}

fun main() {
    dump(earlyReturn(15)); // expecting 15
    dump(earlyReturn(-5)); // expecting 5
    dump(earlyReturn(7));  // expecting 0
}
