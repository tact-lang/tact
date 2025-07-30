contract TestContract {
    // Test 4: Valid hex escape sequence
    receive() {
        let s: String = "Hex value: \x41"; // \x41 should represent 'A'
    }
}
