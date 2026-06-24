struct TestStruct {
    a: Int;
    b: Bool;
}

contract DefaultStructs {
    s1: TestStruct = TestStruct{ a: 42, b: true };
    s2: TestStruct;

    init() {
        self.s2 = TestStruct{ a: 1, b: false };
    }
}