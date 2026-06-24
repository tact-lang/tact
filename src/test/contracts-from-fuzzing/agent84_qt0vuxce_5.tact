contract StringEscapeTest {
    receive() {
        let testString: String = "\nThis should create a new line.\tAnd this should create a tab.\"This is quoted.\"";
    }
}