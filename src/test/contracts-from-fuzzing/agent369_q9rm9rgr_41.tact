struct TestStruct {
    field: Int;
}

contract TestContract {
    s1: TestStruct;
    s2: TestStruct;
    s3: TestStruct;

    init() {
        self.s1 = TestStruct{field: 1};
        self.s2 = TestStruct{field: 2};
        self.s3 = TestStruct{field: 3};
    }
}