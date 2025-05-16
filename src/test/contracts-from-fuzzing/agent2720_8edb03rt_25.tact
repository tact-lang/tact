struct Widths {
    a: Int as uint4;
    b: Int as int8;
    c: Int as uint16;
}

contract Test {
    w: Widths = Widths{ a: 3, b: -5, c: 1234 };
}