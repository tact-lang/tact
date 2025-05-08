// Additional test to validate multiple statements in an if block
fun test_if_block_multiple(): Int {
    if (true) {
        let x: Int = 10;
        let y: Int = 20;
        return x + y; // should return 30
    }
    return 0;
}

// Additional test for nested ternary operator
fun test_nested_ternary(): Int {
    let v: Int = false ? 1 : (true ? 2 : 3);
    return v; // should return 2
}

// Additional test: if without else clause (should simply skip the block when condition is false)
fun test_if_without_else(): Int {
    if (false) {
        return 99; // will not execute
    }
    return 100; // expected value
}

// Entry point for all tests
fun main() {
    test_if_block_multiple();
    test_nested_ternary();
    test_if_without_else();
}
