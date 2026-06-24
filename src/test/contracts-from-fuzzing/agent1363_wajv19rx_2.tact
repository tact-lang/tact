struct TestStruct {
    f1: Int?;
    f2: String?;
}

contract TestContract {
    data: TestStruct?;

    init() {
        self.data = TestStruct{
            f1: 123,
            f2: null,
        };
    }
}