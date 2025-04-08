struct ZeroLengthA {
    foo: Int as uint1;
}
struct ZeroLengthB {
    bar: Bool; // occupies 1 bit
}

contract TinySerializedFields {
    a: ZeroLengthA;
    b: ZeroLengthB;
    init() {
        self.a = ZeroLengthA{ foo: 1 };
        self.b = ZeroLengthB{ bar: true };
    }
}
