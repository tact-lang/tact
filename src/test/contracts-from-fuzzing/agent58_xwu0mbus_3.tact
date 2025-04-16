contract Test {
    receive() {
        // Test: string literal with multiple escape sequences
        let s: String = "Escape sequences: \n new line, \t tab, \r carriage return, \x22 double quote, \u0041 'A', \u{1F602} emoji";
    }
}
