struct SerializeSigned {
    a: Int as int8;
    b: Int as int16;
}

struct SerializeUnsigned {
    c: Int as uint8;
    d: Int as uint16;
}

contract TestContract {
    s1: SerializeSigned;
    s2: SerializeUnsigned;

    init() {
        self.s1 = SerializeSigned{ a: -128, b: -32768 };
        self.s2 = SerializeUnsigned{ c: 255, d: 65535 };
    }
}