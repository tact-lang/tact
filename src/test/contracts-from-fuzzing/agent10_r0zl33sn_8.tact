fun test_hex_valid() {
    // Test valid hex escape sequence: \x41 should produce 'A'
    let s: String = "Hex code: \x41";
    dump(s);
}

contract TestContract {
    receive() {
        test_hex_valid();
    }
}
