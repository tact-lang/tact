struct SerializedMix {
    a: Int as uint1;
    b: Int as int4;
    c: Int as uint8;
    d: Int as int16;
    e: Int as uint32;
    f: Int as int64;
    g: Int as uint128;
    h: Int as int256;
}

contract SerialComplex {
    data: SerializedMix;

    init() {
        self.data = SerializedMix{
            a:1, b:-5, c:234, d:12345, e:555555, f:-1234567890, g:12345678901234567890, h:-123456789012345678901234567890
        };
    }
}