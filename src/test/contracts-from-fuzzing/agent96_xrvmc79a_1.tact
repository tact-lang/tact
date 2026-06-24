contract StringTest {
    receive() {
        let testString: String = "Hello, Tact!";
        dump(testString);
    }
}