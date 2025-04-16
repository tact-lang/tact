struct Inner {
    a: Int as uint8;
    b: Bool;
}

struct Outer {
    nested: Inner;
}

contract NestedSerial {
    s: Outer = Outer{ nested: Inner{ a: 2, b: true } };
}