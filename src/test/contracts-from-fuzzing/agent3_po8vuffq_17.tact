struct Pair {
    a: Int;
    b: Int;
}

fun testDestructuring(): Int {
    let Pair { a, b } = Pair { a: 10, b: 32 };
    // Expected sum = 42
    return a + b;
}

fun testTernaryPrecedence(x: Int): Int {
    // If x > 10, then x * 2, else x + 3
    return x > 10 ? x * 2 : x + 3;
}

fun testOptionalBehavior(opt: Int?): Int {
    // Return opt if not null, else 100
    return opt != null ? opt!! : 100;
}

fun testNestedOptional(opt1: Int?, opt2: Int?): Int? {
    // Correctly use explicit non-null assertions
    if (opt1 != null) {
        return opt2 != null ? opt1!! + opt2!! : opt1!!;
    } else {
        return opt2;
    }
}

fun testArithmeticPrecedence(x: Int, y: Int, z: Int): Int {
    // Expression: x + y * z - (x - z) / 2
    return x + y * z - (x - z) / 2;
}
