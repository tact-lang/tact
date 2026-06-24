struct TestStruct {
    a: Int;
    b: Bool?;
}

contract OptionalBoolStruct {
    s: TestStruct;

    init() {
        self.s = TestStruct{ a: 1, b: null };
    }
}