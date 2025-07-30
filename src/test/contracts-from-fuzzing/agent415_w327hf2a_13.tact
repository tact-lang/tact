struct SmallInt {
    a: Int as int32;
    b: Int;
}

contract StructSerializeAnno {
    s: SmallInt;

    init() {
        self.s = SmallInt{ a: 123, b: 456 };
    }
}