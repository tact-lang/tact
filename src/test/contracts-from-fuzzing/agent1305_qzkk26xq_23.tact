struct TestStruct {
    f1: Int;
    f2: Bool;
}

contract DupAssign {
    data: TestStruct;

    init() {
        self.data = TestStruct{f1: 1, f2: false};
        self.data = TestStruct{f1: 2, f2: true};
    }
}