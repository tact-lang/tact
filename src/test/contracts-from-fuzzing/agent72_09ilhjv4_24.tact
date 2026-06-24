fun conditionalLoopReturn(x: Int): Int {
    repeat (x) {
        if (x == 3) {
            return 999;
        }
    }
    return 0;
}

fun main() {
    let a = conditionalLoopReturn(3);
    let b = conditionalLoopReturn(5);
    dump(a);
    dump(b);
}
