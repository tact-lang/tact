struct TestStruct {
    a: Int? = 5;
    b: Int?;
}

contract BugTest {
    f: TestStruct;

    init() {
        self.f = TestStruct{};
    }
}