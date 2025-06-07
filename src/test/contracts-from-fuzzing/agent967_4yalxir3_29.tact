struct SerialTypes {
    a: Int as int8;
    b: Int as uint16;
    c: Int as int64;
    d: Int as uint32;
}

contract SerializationVarious {
    s: SerialTypes;

    init() {
        self.s = SerialTypes{a: -7, b: 500, c: -100000, d: 40000};
    }
}