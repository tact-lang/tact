struct S1 {
    v1: Int as uint8;
    v2: Int as uint16;
    v3: Int as uint32;
    v4: Int as uint64;
    v5: Int as uint128;
    v6: Int as int8;
    v7: Int as int16;
    v8: Int as int32;
    v9: Int as int64;
    v10: Int as int128;
}

contract IntSerialization {
    s: S1;

    init() {
        self.s = S1{
            v1: 255,
            v2: 65535,
            v3: 4294967295,
            v4: 18446744073709551615,
            v5: 340282366920938463463374607431768211455,
            v6: -128,
            v7: -32768,
            v8: -2147483648,
            v9: -9223372036854775808,
            v10: -170141183460469231731687303715884105728,
        };
    }
}