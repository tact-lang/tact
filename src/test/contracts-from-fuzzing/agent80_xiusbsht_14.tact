contract Test {
    // Attempt to declare an external receiver with a String parameter type,
    // which should be rejected because external receivers must use an inline literal comment
    external(str: String) {
        // This should produce a compile error
    }
}
