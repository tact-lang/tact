contract StringTest {
    receive() {
        let testStr: String = "Hello, Tact!";
        dump(testStr);
    }
}