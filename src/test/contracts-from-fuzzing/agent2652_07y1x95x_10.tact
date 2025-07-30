struct SerialTest {
    a: Int as uint8;
    b: Int as int32;
    c: Int as uint4;
}

contract SerializedFields {
    data: SerialTest;

    init() {
        self.data = SerialTest{ a: 4, b: -1000, c: 7 };
    }
}