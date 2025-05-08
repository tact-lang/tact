// Mix serialization formats across the fields
contract MixSerialization {
    a: Int as uint8;
    b: Int as int16;
    c: Int; // default int257
    d: Int as coins;
    e: Int as uint128;

    init() {
        self.a = 1;
        self.b = -123;
        self.c = 1000;
        self.d = 5000;
        self.e = 100000;
    }

    receive() {
        self.a = 2;
        self.b = 321;
        self.c = -2000;
        self.d = 10000;
        self.e = 999999;
    }
}