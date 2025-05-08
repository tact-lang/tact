// contract with persistent variables with explicit serialization widths
contract TestContract {
    a: Int as int8;
    b: Int as uint8;
    c: Int as int16;
    d: Int as uint16;
    e: Int as int32;
    f: Int as uint32;
    init() {
        self.a = -5;
        self.b = 250;
        self.c = 32000;
        self.d = 65000;
        self.e = 2000000;
        self.f = 4000000;
    }
}