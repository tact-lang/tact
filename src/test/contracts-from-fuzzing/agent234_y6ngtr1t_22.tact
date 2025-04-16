// Testing serialization override for basic types
contract SerialFormats {
    a: Int as uint8;
    b: Int as int64;
    c: Int as uint256;

    init() {
        self.a = 255;
        self.b = 12345;
        self.c = 1234567890;
    }
}