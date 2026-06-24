struct SerializeVariants {
    a: Int as int8;
    b: Int as uint16;
    c: Int as int32;
    d: Int as uint64;
    e: Int as int128;
}

contract SerializeVariantsTest {
    s: SerializeVariants;

    init() {
        self.s = SerializeVariants{
            a: -10,
            b: 65535,
            c: -100000,
            d: 18446744073709551615,
            e: -170141183460469231731687303715884105728,
        };
    }
}