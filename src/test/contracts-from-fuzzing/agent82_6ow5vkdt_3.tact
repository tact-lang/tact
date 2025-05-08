contract StringTest {
    receive() {
        let escapedStr: String = "This is a line.\nAnd this is a new line.";
        dump(escapedStr);
    }
}