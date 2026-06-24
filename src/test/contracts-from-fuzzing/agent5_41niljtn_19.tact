// Multiple primitives, some with explicit serializer annotations
contract SerializeHints {
    a: Int as uint8 = 5;
    b: Int as uint32 = 10;
    c: Int as int64 = -1;
    d: Int as int257 = 123456789;

    init() {
        self.a = 255; // max for uint8
        self.b = 123456789;
        self.c = -42;
        self.d = 0;
    }
}