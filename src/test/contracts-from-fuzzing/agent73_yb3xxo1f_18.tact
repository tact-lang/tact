contract Test {
    receive() {
        // Testing equality of escape sequences representing ASCII character 'A'
        let a: String = "\u0041";  // Unicode escape with four digits
        let b: String = "\x41";    // Hex escape with two digits
        let c: String = "\u{41}";   // Braced Unicode escape
        let d: String = "A";         // Direct literal
        if (a != b || b != c || c != d) {
            throw(100); // If any inequality, error
        }
    }
}
