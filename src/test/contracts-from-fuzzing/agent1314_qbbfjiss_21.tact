struct AscribeSerialization {
    a: Int as int8;
    b: Int as uint16;
    c: Int as uint4;
}

contract SerializationAscribed {
    s: AscribeSerialization;

    init() {
        self.s = AscribeSerialization{ a: -5, b: 42, c: 8 };
    }
}