contract IntVariety {
    signed64: Int as int64;
    unsigned64: Int as uint64;
    plain: Int;

    init() {
        self.signed64 = -123456789;
        self.unsigned64 = 123456789;
        self.plain = -1;
    }
}