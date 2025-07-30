contract TestNullChar {
    receive() {
        // Testing string literal containing an explicit null character via hex escape
        let s: String = "Test \x00 with null";
    }
}
