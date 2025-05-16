struct TestStruct {
    f1: Int;
    f2: Int?;
}

contract TestNullDefaults {
    s: TestStruct;

    init() {
        self.s = TestStruct {
            f1: 10,
            f2: null
        };
    }
}