contract StringTest {
    receive() {
        let str: String = "Hello, World!";
        dump(str);
    }
}