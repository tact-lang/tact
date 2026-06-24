contract StringTest {
    receive() {
        let str1: String = "Test string 1";
        let str2: String = "Test string 1";
        let result: Bool = str1 == str2;
    }
}