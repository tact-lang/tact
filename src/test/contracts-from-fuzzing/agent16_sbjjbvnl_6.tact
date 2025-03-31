contract LazyInit {
    // In absence of contract parameters, the init() function is redundant.
    // According to documentation, this should compile successfully.
    init() {}
}

// Inline function example: should be inlined automatically.
inline fun add(x: Int, y: Int): Int {
    return x + y;
}

fun testInline(): Int {
    return add(3, 4);
}

// Functions comparing branching and arithmetic approaches for decision making.
fun ternaryTest(x: Int): Int {
    // Uses ternary operator for conditional execution
    return x > 0 ? 3 : 2;
}

fun arithmeticTest(x: Int): Int {
    // Uses arithmetic operation: sign(x) returns -1, 0, or 1, so shifting by 1.
    return 1 + sign(x);
}
