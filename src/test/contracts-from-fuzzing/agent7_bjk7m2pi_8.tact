// Test 1: Optional correct access
fun testOptionalCorrect() {
    let a: Int? = null;
    if (a == null) {
        dump(0); // expected to dump 0
    } else {
        dump(a!!);
    }
}

fun main() {
    testOptionalCorrect();
}
