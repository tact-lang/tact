contract Test {
    receive() {
        // Test 20: Check that string equality works between a literal and a hex escape representation
        let a: String = "A";
        let b: String = "\x41"; // \x41 should represent 'A'
        if (a == b) {
            dump(1);
        } else {
            dump(0);
        }
    }
}
