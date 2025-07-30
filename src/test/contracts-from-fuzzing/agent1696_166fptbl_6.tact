struct SerializedStruct {
    a: Int as uint32;
    b: Int as int64;
    c: Int as uint8;
    d: Int;
}

contract SerializedStructTest {
    data: SerializedStruct;

    init() {
        self.data = SerializedStruct{ a: 1, b: 2, c: 3, d: 4 };
    }
}