struct TestStruct {
    a: Int = 0;
    b: Int? = null;
    c: String? = null;
    d: Bool = false;
    e: Bool? = null;
}

contract StructWithDefaults {
    test: TestStruct;

    init() {
        self.test = TestStruct{};
    }
}