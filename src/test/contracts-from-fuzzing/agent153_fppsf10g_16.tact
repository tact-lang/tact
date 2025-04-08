contract PrimitivesSerialized {
    int4: Int as int4;
    uint10: Int as uint10;
    int64: Int as int64;
    uint200: Int as uint200;

    init() {
        self.int4 = 7;
        self.uint10 = 100;
        self.int64 = 5000;
        self.uint200 = 100000;
    }

    receive() {
        self.int64 += 1;
    }
}