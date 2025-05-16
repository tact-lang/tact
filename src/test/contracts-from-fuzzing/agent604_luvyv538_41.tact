struct TestStruct {
    a: Int = 1;
    b: Bool = false;
    c: String = "a";
}

contract AssignSubset {
    s: TestStruct;

    init() {
        self.s = TestStruct{ };
    }
}