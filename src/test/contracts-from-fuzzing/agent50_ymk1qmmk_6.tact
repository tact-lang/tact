fun loopReturn(x: Int): Int {
    repeat (5) {
        if (x == 3) { return x * 10; }
    }
    return 0;
}

fun main() {
    dump(loopReturn(3)); // expecting 30
    dump(loopReturn(7)); // expecting 0
}
