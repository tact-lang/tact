struct SerialTest {
    a: Int as int8;
    b: Int as uint64;
}

contract SerializationEdge {
    data: SerialTest;

    init() {
        self.data = SerialTest{ a: -5, b: 123456789 };
    }
}