contract StringEscapeTest {
    receive() {
        let escapedStr: String = "Line1\nLine2\tTabbed";
        dump(escapedStr);
    }
}