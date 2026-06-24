contract TestEndingBackslash {
    receive() {
        // Testing a string literal that ends with an escaped backslash
        // To represent a single backslash at the end, we need \\ in source
        let s: String = "Ends with backslash: \\";
    }
}
