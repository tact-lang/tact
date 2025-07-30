struct MixedSized {
    a: Int as uint8;
    b: Int as int32;
    c: Int as uint64;
    d: Int as int257;
    e: Int as uint4;
    f: Int as int16;
    g: Int as uint128;
    h: Int as int8;
}

contract TestContract {
    data: MixedSized;

    init() {
        self.data = MixedSized{
            a: 1,
            b: -1000,
            c: 123456789,
            d: 42,
            e: 7,
            f: -30000,
            g: 12345678901234567890123,
            h: -8
        };
    }
}