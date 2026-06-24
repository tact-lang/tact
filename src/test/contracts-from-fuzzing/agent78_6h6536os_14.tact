contract TestStringConcatSB {
    // Test string concatenation using the StringBuilder.concat method
    receive() {
        let s: String = beginString().concat("Hello, ").concat("Tact!").toString();
    }
}
