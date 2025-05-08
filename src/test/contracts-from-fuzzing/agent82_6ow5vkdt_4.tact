contract StringTest {
    receive() {
        let str: String = "This is a test: \t\nNew line and tab.";
        dump(str);
    }
}