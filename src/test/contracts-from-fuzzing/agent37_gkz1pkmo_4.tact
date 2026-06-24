contract TestStringLiterals {
    receive() {
        let s1: String = "Hello, Tact!";
        let s2: String = "Escape sequences: \n newline, \t tab, \\ backslash";
        let s3: String = "Unicode: \u{1F602}";
    }
}
