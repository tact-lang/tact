contract StringEscapeSequenceTest {
    receive() {
        let normal = "Hello, World!";
        let newline = "Hello,\nWorld!";
        let tab = "Hello,\tWorld!";
        let quote = "Hello, \"World!\"";
        let backslash = "Hello,\\World!";
        let mixed = "Line1:\nLine2:\t\"Quoted\"\\Backslash";
    }
}