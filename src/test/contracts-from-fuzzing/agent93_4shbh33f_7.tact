contract TestStringEquality {
    receive() {
        // Test string literal equality
        let a: String = "test equality";
        let b: String = "test equality";
        if (a == b) {
            // Equality holds
        } else {
            // Unreachable
        }
    }
}
