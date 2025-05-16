fun test_operator_precedence() {
    // Expected: 1 + (2*3) - (4/2) = 1 + 6 - 2 = 5
    let a = 1 + 2 * 3 - 4 / 2;
    dump(a);
}

fun test_negative_literal() {
    // Expected multiplication: -5 * 3 = -15
    let x = -5 * 3;
    dump(x);
}

fun test_logical_precedence() {
    // Expected: false && false is false, then true || false is true
    let b = true || false && false;
    if (b) { dump(1); } else { dump(0); }
}

fun main() {
    test_operator_precedence();
    test_negative_literal();
    test_logical_precedence();
}
