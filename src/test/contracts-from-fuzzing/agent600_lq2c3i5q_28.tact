// contract fields using serialization specifiers
contract SerializePrimitives {
    a: Int as uint8;
    b: Int as int32;
    c: Int as uint256;

    init() {
        self.a = 1;
        self.b = -2;
        self.c = 3;
    }
}