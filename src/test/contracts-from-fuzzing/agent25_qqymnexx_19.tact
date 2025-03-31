contract Test {
    receive() {
        // Test a string literal containing multiple escape sequences
        // Expected escapes:
        // \\ -> literal backslash
        // "  -> literal double quote
        // \n -> newline
        // \r -> carriage return
        // \t -> tab
        // \v -> vertical tab
        // \b -> backspace
        // \f -> form feed
        // \x00 and \xFF -> hex escape (00 and FF)
        // \u0000 and \uFFFF -> 4-digit Unicode escape
        // \u{1F44D} -> Unicode escape with variable length (thumbs up emoji)
        let s: String = "Escape test: \\ \" \n \r \t \v \b \f \x00 \xFF \u0000 \uFFFF \u{1F44D}";
        dump(s);
    }
}
