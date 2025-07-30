// Snippet 1: Function-level control flow test with try-catch and early return
fun controlTest() : Int {
    try {
        if (true) {
            return 1; // early return inside try
        }
        return 2;
    } catch (e) {
        return 3; // fallback in case of exception
    }
}

fun main() {
    dump(controlTest()); // Expected output: 1
}
