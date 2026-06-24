// Test contract field ordering affects serialization
contract FieldOrder {
    a: Int as uint8;
    b: Bool;
    c: Int as uint32;
    d: Bool;
    e: Int;

    init() {
        self.a = 1;
        self.b = true;
        self.c = 1000;
        self.d = false;
        self.e = 123456789;
    }
}