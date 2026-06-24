struct IntFormats {
    a: Int as uint8;
    b: Int as int64;
    c: Int as coins;
    d: Int;
}

contract SerialFormats {
    data: IntFormats = IntFormats{
        a: 255,
        b: -9223372036854775808,
        c: 1000000000,
        d: 123456789
    };
}