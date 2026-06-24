struct TestStruct {
    count: Int? as uint32;
}

contract TestContract {
    s: TestStruct;

    init() {
        self.s = TestStruct{ count: null };
    }
}