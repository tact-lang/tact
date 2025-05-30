contract Test {
    receive() {
        // Attempt backslash escaping of double quotes
        let x: String = "He said \"Hello World\"";
    }
}