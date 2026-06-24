contract StringEscapeTest {
    receive() {
        // This string contains all valid escape sequences
        let s: String = "Line1\nLine2\tTabbed\rCarriage\vVertical\bBackspace\fFormFeed\\Backslash\"Quote";
    }
}
