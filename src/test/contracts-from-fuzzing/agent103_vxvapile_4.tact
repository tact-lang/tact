contract TestValidEscapes {
    receive() {
        // Test string with valid escape sequences:
        // \n newline, \t tab, \" double quote, \x41 (A), \u{1F600} (😀)
        let s: String = "Line\nNewline, tab:\t and quote: \"End\" with hex: \x41 and unicode: \u{1F600}";
        dump(s);
    }
}
