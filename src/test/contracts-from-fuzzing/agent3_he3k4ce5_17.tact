contract Test {
    // External receiver declared using a parameter type instead of a literal comment,
    // which should be rejected by the compiler as per the external receiver syntax.
    external(msg: String) {
        // No operation
    }
}
