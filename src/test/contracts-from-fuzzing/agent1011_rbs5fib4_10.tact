struct TestString {
    s1: String = "hello";
    s2: String = "world";
}

contract StringFields {
    data: TestString;

    init() {
        self.data = TestString{};
    }
}