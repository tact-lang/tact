contract MixSerialization {
    a: Int as uint8;
    b: Int as int64;
    c: Int as uint256;
    d: Int;

    init() {
        self.a = 1;
        self.b = -100;
        self.c = 42;
        self.d = 9;
    }
}