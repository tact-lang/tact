struct Serializations {
    a: Int as int8;
    b: Int as uint16;
    c: Int as coins;
    d: Int as int257;
}

contract SerializeVariants {
    s: Serializations;

    init() {
        self.s = Serializations{
            a: -2,
            b: 65535,
            c: ton("1"),
            d: -12345678
        };
    }
}
