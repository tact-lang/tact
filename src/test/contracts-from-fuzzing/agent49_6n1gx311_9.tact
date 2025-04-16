contract TestOptional {
    receive() {
        // Optional-related expression test:
        // Declare an optional Int initialized to null and then use a ternary expression to provide a fallback value
        let opt: Int? = null;
        let result: Int = opt != null ? opt!! : 999;
        dump(result); // Expected output: 999
    }
}
