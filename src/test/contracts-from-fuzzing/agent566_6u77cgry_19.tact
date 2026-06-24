struct TestStruct {
    x: Int as uint8;
}

contract SerializationEdge {
    data: TestStruct;

    init() {
        self.data = TestStruct { x: 300 };
    }
}