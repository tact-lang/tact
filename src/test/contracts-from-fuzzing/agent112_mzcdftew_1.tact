/* Test 1: Regular function using multiple return paths */
fun multipleReturn(a: Int): Int {
    if (a > 0) {
        return a;
    } else {
        return -a;
    }
}

fun main() {
    multipleReturn(5);
    multipleReturn(-3);
}
