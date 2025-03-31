fun test_nested(a: Int): Int {
    if (a > 0) {
        if (a > 10) {
            return 100;
        } else {
            return 50;
        }
    } else if (a < 0) {
        return -1;
    } else {
        return 0;
    }
}

fun main() {
    test_nested(15);
    test_nested(5);
    test_nested(-3);
    test_nested(0);
}
