struct Inner {
    one: Int as int8;
    two: Int as uint16;
    three: Int as uint32;
    four: Int as int64;
    five: Int as int128;
}

contract SerializationVariants {
    si: Inner;

    init() {
        self.si = Inner{
            one: 12,
            two: 65535,
            three: 4294967295,
            four: 10000000000,
            five: -123456789012345678901234567890
        };
    }
}
