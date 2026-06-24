fun earlyReturn(x: Int): Int {
    if (x < 0) {
         return 0;
    }
    return x;
}

fun main() {
    // For testing purposes
    let a = earlyReturn(-5);
    let b = earlyReturn(10);
    dump(a);
    dump(b);
    return;
}