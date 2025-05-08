fun testFunc(a: Int): Int {
    if (a > 0) {
        return a;
    }
    return 0;
}

fun main() {
    let res = testFunc(5);
    dump(res);
}