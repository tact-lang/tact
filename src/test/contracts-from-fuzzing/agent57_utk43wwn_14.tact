contract Test {
    receive() {
        // Test H: Combining multiple Unicode escape sequences
        let s: String = "\u{41}\u{42}\u{43}, \u{1F600}!"; // Expected: "ABC, 😀!"
        dump(s);
    }
}
