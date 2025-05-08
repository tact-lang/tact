struct SerialMix {
    a: Int as uint4;
    b: Int as int8;
    c: Int as uint16;
    d: Int as int32;
    e: Int as uint64;
    f: Int as int128;
    g: Int;
}

contract SerializeVariants {
    s: SerialMix;

    init() {
        self.s = SerialMix{
            a: 15,
            b: -128,
            c: 65535,
            d: -2147483648,
            e: 18446744073709551615,
            f: -170141183460469231731687303715884105728,
            g: -1
        };
    }
}