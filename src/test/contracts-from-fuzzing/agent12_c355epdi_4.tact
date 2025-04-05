contract StringTest {
    receive() {
        let s: String = "Hello, Tact!";
        dump(s);
    }
}
