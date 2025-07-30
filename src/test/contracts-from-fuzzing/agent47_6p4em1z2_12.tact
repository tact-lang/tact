contract TestStringLiteralsEscapes {
    receive() {
        // Test various valid escape sequences in string literals
        let s1: String = "Line break\nNew line";
        let s2: String = "Quote: \"Tact\"";
        let s3: String = "Backslash: \\";
        let s4: String = "Tab\tseparated";
        dump(s1);
        dump(s2);
        dump(s3);
        dump(s4);
    }
}
