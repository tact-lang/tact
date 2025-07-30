contract Test {
    receive() {
        // Test string with various escape sequences: \\ (backslash), \" (double quote), \n (newline), \t (tab), \x41 ('A'), \u0042 ('B'), and \u{1F602} (😂)
        let s: String = "escape \\ and \"quoted\" and newline\n and tab\t and \x41 and \u0042 and \u{1F602}";
    }
}
