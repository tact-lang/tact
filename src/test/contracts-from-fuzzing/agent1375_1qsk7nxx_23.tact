struct TestStruct {
    a: Int;
    b: Bool;
    c: String = "hi";
}

contract DefaultedFields {
    s: TestStruct;

    init() {
        self.s = TestStruct{a: 1, b: false};
    }
}