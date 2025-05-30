contract ExplicitSizes {
    a: Int as int64;
    b: Int as uint8;
    c: Int as coins;
    d: Bool;
    e: Bool?;

    init() {
        self.a = -9223372036854775808; // min int64
        self.b = 255; // max uint8
        self.c = 1000000000; // 1 TON
        self.d = true;
        self.e = null;
    }
}