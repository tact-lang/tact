contract StringTest {
    receive() {
        let s: String = "This string contains a tab:\t and a newline:\n.";
        dump(s);
    }
}