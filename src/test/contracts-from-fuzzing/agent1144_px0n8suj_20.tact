// Edge case: field order with mixed serialization hints
contract SerializationOrder {
    a: Int;
    b: Int as uint16;
    c: Int;
    d: Int as int8;

    init() {
        self.a=1; self.b=2; self.c=3; self.d=4;
    }
}