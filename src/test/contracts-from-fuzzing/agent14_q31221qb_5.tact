struct Two { first: Int; second: String }

fun testDestructuring(s: Two): Int {
    let Two { second, first } = s;
    return first;
}

// A simple function to trigger the test
fun main() {
    // Test with a literal construction
    let s = Two { first: 42, second: "hello" };
    let result = testDestructuring(s);
    result;
}
