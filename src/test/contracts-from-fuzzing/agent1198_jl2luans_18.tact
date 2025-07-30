struct IntsMany {
    a: Int as int8;
    b: Int as uint8;
    c: Int as int16;
    d: Int as uint16;
    e: Int as int32;
    f: Int as uint32;
    g: Int as int64;
    h: Int as uint64;
    i: Int as int128;
    j: Int as uint128;
}

contract SerializedInts {
    s: IntsMany;

    init() {
        self.s = IntsMany{
            a: -128, b: 255, c: -32768, d: 65535, e: -2147483648,
            f: 4294967295, g: -9223372036854775808, h: 18446744073709551615,
            i: -170141183460469231731687303715884105728,
            j: 340282366920938463463374607431768211455,
        };
    }
}