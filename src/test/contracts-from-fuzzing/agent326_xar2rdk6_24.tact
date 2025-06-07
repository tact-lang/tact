// check serialization with explicit narrow format
contract SerializationCheck {
    a: Int as uint8;
    b: Int as uint16;
    c: Int as int1;
    d: Int as int64;

    init() {
        self.a = 255;
        self.b = 65535;
        self.c = 0;
        self.d = 123456789;
    }

    receive() {
        self.a = self.a;
    }
}