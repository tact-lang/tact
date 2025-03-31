fun testReturnConditions(val: Bool): Int {
    if (val) {
        return 42;
    } else {
        return 7;
    }
}

fun main() {
    dump(testReturnConditions(true));
    dump(testReturnConditions(false));
}
