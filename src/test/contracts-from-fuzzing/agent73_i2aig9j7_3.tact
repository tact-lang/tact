contract StringTest {
    receive() {
        let s: String = "Example with escape sequences: \nNew line, \tTabbed.";
        dump(s);
    }
}