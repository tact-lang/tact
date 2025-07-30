struct SerializeFormats {
    a: Int as uint1;
    b: Int as int8;
    c: Int as uint32;
    d: Int as int257;
    e: Int;
}

contract SerializeNested {
    s: SerializeFormats;

    init() {
        self.s = SerializeFormats{
            a: 1,
            b: -5,
            c: 4294967295,
            d: -123456789012345,
            e: 99
        };
    }
}