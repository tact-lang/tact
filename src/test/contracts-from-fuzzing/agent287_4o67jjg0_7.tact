struct SerialFormats {
    u1: Int as uint1;
    i8: Int as int8;
    u64: Int as uint64;
    i257: Int as int257;
}

contract SerializationSpecifiers {
    s: SerialFormats;
    init() {
        self.s = SerialFormats{
            u1: 1,
            i8: -128,
            u64: 42,
            i257: 1234567
        };
    }
}