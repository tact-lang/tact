contract TestEscape {
    receive() {
        let s: String = "This is a newline: \n and a tab: \t and a quote: \" and backslash: \\";
    }
}
