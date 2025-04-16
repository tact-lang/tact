struct SerialStruct {
    a: Int as int8;
    b: Int as uint16;
}

contract StructSerialization {
    data: SerialStruct;
    init() {
        self.data = SerialStruct{ a: 1, b: 2 };
    }
}