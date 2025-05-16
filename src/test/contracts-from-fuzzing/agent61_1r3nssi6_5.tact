// Test Case 4: Map Usage - Valid scenario
// This contract tests the map type as described in the documentation [Maps in the Book].
// It creates a map<Int, Int>, sets a value, retrieves it with a non-null assertion, and dumps the result.

contract TestMapUsage {
    receive() {
        let m: map<Int, Int> = emptyMap();
        m.set(1, 100);
        dump(m.get(1)!!); // Expected output: 100
        cashback(sender());
    }
}
