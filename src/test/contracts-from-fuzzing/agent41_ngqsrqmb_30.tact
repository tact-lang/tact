// Primitive fields with explicit serialization bitsizes on contract
contract SerializePrimitives {
    a: Int as uint4;
    b: Int as int8;
    c: Int as uint32;
    d: Int as int64;

    init() {
        self.a = 7;
        self.b = -50;
        self.c = 123456;
        self.d = -987654321;
    }
}