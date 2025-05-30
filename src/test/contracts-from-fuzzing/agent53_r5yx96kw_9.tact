contract Test {
    receive() {
        // Test escape sequences with Unicode code points at the boundaries
        let a: String = "Start: \u{1} Middle: \u{D} End: \u{10FFFF}";
        // Test common escapes
        let b: String = "Line1\nLine2\tTabbed";
    }
}
