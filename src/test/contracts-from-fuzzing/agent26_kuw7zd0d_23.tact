contract TestHexEscapeCase {
    receive() {
        // Testing hex escape sequences with both lower and upper case
        let s: String = "Hex test: \x0a, \x0A, \x1f, \x1F";
    }
}
