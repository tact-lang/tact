contract TestUnicodeMultipleEscapes {
    receive() {
        // Test a string literal with multiple consecutive escape sequences
        let s: String = "\n\t\r\b\f\v\u0020\u{1F60A}\x41"; // Contains newline, tab, carriage return, backspace, form feed, vertical tab, space, smiling emoji, and 'A'
    }
}
