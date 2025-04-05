fun testLetStatements(): Int {
    // Test 1: let statement with explicit type
    let a: Int = 10;
    // Test 2: let statement with inferred type
    let b = 20;
    return a + b; // expected 30
}

contract Test {
    receive() {
        dump(testLetStatements());
    }
}
