struct IntSerialization {
    a: Int as int4;
    b: Int as uint12;
    c: Int as int257;
}

contract IntSerializations {
    v: IntSerialization;

    init() {
        self.v = IntSerialization{
            a: 7,
            b: 2047,
            c: -123456
        };
    }
}