contract MixSerialization {
    a: Int as uint8;
    b: Int as int64;
    c: Int;
    d: Int as uint256;

    init() {
        self.a = 1;
        self.b = -1;
        self.c = 999999999;
        self.d = 0;
    }
}