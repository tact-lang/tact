struct SerialStruct {
    a: Int as uint8;
    b: Int as int64;
    c: Int as uint16;
}

contract StructSerialization {
    s: SerialStruct;

    init() {
        self.s = SerialStruct{ a:5, b:6, c:7 };
    }
}