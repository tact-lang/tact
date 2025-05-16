struct SerStruct {
    a: Int as uint8;
    b: Int as int32;
}

contract StructSerialization {
    s: SerStruct;

    init() {
        self.s = SerStruct{ a: 1, b: -1 };
    }
}