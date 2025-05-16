// Contract combining fields with explicit serialization sizes
contract WithSerialization {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint32;
    d: Int;

    init() {
        self.a = 1;
        self.b = -100;
        self.c = 100000;
        self.d = 99999999;
    }
}