contract EscapeTest {
    receive() {
        // Testing various escape sequences: newline (\n), tab (\t), hex escape (\x21 for '!'), and escaped double quotes
        let s: String = "Line1\nLine2\tTabbed\x21 \"quoted\"";
        s;
    }
}
