struct SerialTest {
    x: Int as int8;
    y: Int as uint16;
    z: Int as int64;
}

contract SerializationEdge {
    field: SerialTest;

    init() {
        self.field = SerialTest{ x: 5, y: 500, z: 100000 };
    }
}