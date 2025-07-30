contract StringEscapeTest {
    receive() {
        let escapedStr: String = "Line 1\nLine 2\tTabbed!";
        dump(escapedStr);
    }
}