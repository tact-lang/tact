struct IntSerStruct {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint4;
}

contract StructWithIntSer {
    s: IntSerStruct;

    init() {
        self.s = IntSerStruct{ a: 12, b: -123, c: 9 };
    }
}