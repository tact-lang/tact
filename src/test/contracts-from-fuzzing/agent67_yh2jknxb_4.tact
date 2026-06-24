contract TestEscapeSequences {
    receive() {
        let s1: String = "escape \\ sequences";
        let s2: String = "this \"literally\" works";
        let s3: String = "line \n new line";
        let s4: String = "Shutters \r test";
        let s5: String = "tab \t here";
        let s6: String = "vertical \v tab";
        let s7: String = "back \b backspace";
        let s8: String = "form \f feed";
        let s9: String = "hex \x41 code";
        let s10: String = "unicode \u26A1";
        let s11: String = "unicode braced \u{1F602}";
        // Dumping the strings to ensure they're used and compiled
        dump(s1);
        dump(s2);
        dump(s3);
        dump(s4);
        dump(s5);
        dump(s6);
        dump(s7);
        dump(s8);
        dump(s9);
        dump(s10);
        dump(s11);
    }
}
