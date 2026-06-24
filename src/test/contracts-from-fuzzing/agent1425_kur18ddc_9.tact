struct Serialized {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint32;
    d: Int as int64;
    e: Int as uint128;
    f: Int; // default int257
}

contract TestContract {
    s: Serialized;

    init() {
        self.s = Serialized{
            a: 5,
            b: -1234,
            c: 123456,
            d: -78901234,
            e: 1234567890123456,
            f: 42
        };
    }

    receive() {}
}