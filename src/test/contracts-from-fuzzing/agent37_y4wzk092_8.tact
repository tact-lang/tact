contract TestHexEscape {
    receive() {
        // Testing valid hex escape sequence \x41 should result in 'A'
        let s: String = "correct hex: \x41";
    }
}
