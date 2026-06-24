struct IntSerialization {
    u1: Int as uint8;
    u2: Int as uint64;
    s1: Int as int8;
    s2: Int as int64;
}

contract IntSerialize {
    val: IntSerialization;

    init() {
        self.val = IntSerialization{u1: 255, u2: 1234567890123, s1: -128, s2: -987654321};
    }
}