contract StringFunctionTest {
    receive() {
        let str: String = "Hello, World!";
        let hash: Int = str.hashData();
    }
}