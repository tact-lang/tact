struct TestStruct {
    s: String;
}

contract TestContract {
    f1: TestStruct;
    f2: TestStruct;

    init() {
        self.f1 = TestStruct{ s: "hello" };
        self.f2 = TestStruct{ s: "world" };
    }
}