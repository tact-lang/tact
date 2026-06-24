struct TestStruct {
    number: Int;
    optionalStr: String?;
}

contract OptionalStringEdge {
    data: TestStruct;

    init() {
        self.data = TestStruct{ number: 123, optionalStr: null };
    }
}