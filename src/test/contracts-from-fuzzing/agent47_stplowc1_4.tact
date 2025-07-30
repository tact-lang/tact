contract TestContract2 {
    receive() {
        let s: String = "Backslash: \\, Quote: \" , Newline: \n, Hex: \x41, Unicode: \u0042, Emoji: \u{1F60A}";
        s;
    }
}
