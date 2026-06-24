struct IntSizes {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint64;
    d: Int;
}

contract TestContract {
    data: IntSizes;

    init() {
        self.data = IntSizes{ a:1, b:-2, c:1000, d:-999 };
    }
}