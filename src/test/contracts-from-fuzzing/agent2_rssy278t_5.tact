fun test_prec(): Int {
    // Operator precedence: 5 * 5 - 2 = (5 * 5) - 2 = 23
    return 5 * 5 - 2;
}

fun test_paren(): Int {
    // Using parentheses to override precedence: 5 * (5 - 2) = 15
    return 5 * (5 - 2);
}

fun test_nested_safe(): Int {
    // Use 3 levels of nested parentheses, which should be valid
    let x = (((42)));
    return x;
}

fun test_unary(): Int {
    // Unary negation: -(-1) should yield 1
    return -(-1);
}

fun test_nonnull(valOpt: Int?): Int {
    // Non-null assertion operator !!: access value if non-null
    return valOpt!!;
}

fun test_pow(): Int {
    // Compute power without overflow: 2 * 2^254
    return pow(2, 254) + pow(2, 254);
}
