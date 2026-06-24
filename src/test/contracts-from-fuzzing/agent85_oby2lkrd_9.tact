contract Test {
    receive() {
        // Test: String equality with embedded newline characters
        let a: String = "Hello \nWorld"; // actual newline
        let b: String = "Hello \nWorld";
        if (a == b) {
            dump(1);
        } else {
            dump(0);
        }
    }
}
