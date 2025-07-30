// Test Case 2: Optionals - Valid Usage
// This contract tests optionals by initializing an optional integer, assigning it a non-null value, and then using the non-null assertion operator.
// According to documentation, this should correctly yield the value (42) when dumped.

contract TestOptionalValid {
    receive() {
        let a: Int? = null;
        a = 42;
        dump(a!!); // Expected output: 42
        cashback(sender());
    }
}
