contract Test {
    // Testing string equality inside an if condition
    receive() {
        let greeting: String = "hello";
        if (greeting == "hello") {
            // Using valid string literal in condition
            let response: String = "Matched";
        } else {
            let response: String = "Not Matched";
        }
    }
}
