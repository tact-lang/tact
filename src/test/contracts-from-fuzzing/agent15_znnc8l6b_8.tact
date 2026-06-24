contract Test {
    receive() {
        let a: String = "Tact";
        let b: String = "Tact";
        if (a == b) {
            // Comparison succeeded
            a;
        } else {
            // Should not happen
            b;
        }
    }
}
