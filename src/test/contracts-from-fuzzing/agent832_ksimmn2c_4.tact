struct TestStruct {
    num: Int;
}

contract OptionalNestedStruct {
    data: TestStruct?;

    init() {
        self.data = null;
    }
}