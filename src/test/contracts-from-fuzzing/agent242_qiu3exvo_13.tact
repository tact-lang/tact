struct Diverse {
    a: Int as int8;
    b: Int as uint16;
    c: Bool;
    d: Int as uint1;
    e: Int as int257;
}

contract MultiSerialized {
    data: Diverse = Diverse{ a: -5, b: 65535, c: true, d: 1, e: -123456789 };
}