// Test Case 1: Function with nested conditional returns
fun testNestedReturn(a: Int): Int {
    if (a > 0) {
       { if (a < 100) { return a + 10; } } 
    } else {
       return a - 10;
    }
    return 0;
}

fun main() {
    let _ = testNestedReturn(50);
    let _ = testNestedReturn(-10);
}
