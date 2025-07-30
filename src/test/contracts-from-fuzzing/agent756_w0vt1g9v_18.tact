struct IntSizes {
    a: Int as uint4;
    b: Int as int8;
    c: Int as uint32;
    d: Int; // default int257
}

contract SerializeIntSizes {
    ints: IntSizes;
    init() {
        self.ints = IntSizes{ a: 7, b: -5, c: 123456, d: 777 };
    }
}