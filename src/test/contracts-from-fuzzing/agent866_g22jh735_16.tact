contract SerializationBits {
    a: Int as uint8 = 1;
    b: Int as int16;
    c: Int as uint32;
    d: Int as int64;
    e: Int as uint128;

    init() {
        self.b = -123;
        self.c = 1000;
        self.d = -12345678;
        self.e = 1234567890123456789;
    }
}

contract Dummy {receive(){}}