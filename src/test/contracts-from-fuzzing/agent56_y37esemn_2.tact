contract TestInvalidHexEscape {
    receive() {
        // Testing invalid hex escape sequence that does not have exactly two hex digits
        let s: String = "Invalid \x123 escape";  
    }
}
