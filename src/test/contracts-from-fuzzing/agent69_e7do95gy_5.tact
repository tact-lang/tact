contract TestUnicodeEscape {
    receive() {
        // Test 4: Unicode escape sequences using \u{...}
        let s: String = "emoji: \u{1F602}"; // should represent 😂
    }
}
