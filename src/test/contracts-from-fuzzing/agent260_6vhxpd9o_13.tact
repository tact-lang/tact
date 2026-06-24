struct SerStruct {
    small: Int as uint8;
    signed: Int as int16;
}

contract SerializeNested {
    data: SerStruct;

    init() {
        self.data = SerStruct{ small: 100, signed: -123 };
    }
}