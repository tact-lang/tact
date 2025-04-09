contract EscapeTest {
    receive() {
        // Testing various escape sequences in string literal
        let s: String = "escape sequences: \\ double-quote: \" newline: \n tab: \t vertical tab: \v backspace: \b form feed: \f hex A: \x41 unicode grinning: \u{1F600}";
    }
}
