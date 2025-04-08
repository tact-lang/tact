struct StructInnerInt {
    foo: Int;
}

contract TestChangeOrder {
    b: Int;
    s: StructInnerInt;
    a: Int;

    init() {
        self.b = 2;
        self.s = StructInnerInt{ foo: 3 };
        self.a = 1;
    }
}