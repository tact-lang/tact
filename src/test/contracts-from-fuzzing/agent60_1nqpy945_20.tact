struct SerializeVariants {
    a: Int as int8;
    b: Int as uint8;
    c: Int as int32;
    d: Int as uint32;
    e: Int as int64;
    f: Int as uint64;
    g: Int as int257;
}

contract TestContract {
    st: SerializeVariants;

    init() {
        self.st = SerializeVariants{
            a: -5,
            b: 5,
            c: -123456,
            d: 123456,
            e: -9999999,
            f: 9999999,
            g: 1
        };
    }
}