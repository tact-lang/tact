contract EdgeIntSizes {
    int4: Int as int4;
    int8: Int as int8;
    int64: Int as int64;
    int257: Int as int257;

    init() {
        self.int4 = 7;
        self.int8 = 100;
        self.int64 = 1234567;
        self.int257 = 12345678910;
    }
}