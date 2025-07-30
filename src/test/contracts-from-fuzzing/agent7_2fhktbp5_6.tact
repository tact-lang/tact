contract TestLiteralStrings {
    receive() {
        // Literal String expression test
        let greeting: String = "Hello, Tact!";
        dump(greeting);
    }
}
