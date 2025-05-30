fun testTernary(): Int {
    // According to the documentation, the ternary operator is right-associative
    // Therefore, false ? 1 : true ? 2 : 3 should evaluate to: 2
    return false ? 1 : true ? 2 : 3;
}

contract TernaryTest {
    receive() {
        dump(testTernary());
        cashback(sender());
    }
}
