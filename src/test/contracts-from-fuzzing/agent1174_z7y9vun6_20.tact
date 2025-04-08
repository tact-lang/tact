struct IntSizes {
    a: Int as uint8;
    b: Int as uint16;
    c: Int as int32;
    d: Int;
}

contract VariousIntSizes {
    s: IntSizes = IntSizes{ a:1, b:2, c:3, d:4 };
}