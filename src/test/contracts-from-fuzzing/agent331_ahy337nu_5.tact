struct TestStruct {
    flag: Bool;
    text: String;
}

contract OptionalPersistent {
    data: TestStruct?;

    init() {
        self.data = null;
    }
}