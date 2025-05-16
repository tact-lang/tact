contract VariousIntsSerialized {
    val8: Int as uint8;
    val16: Int as int16;
    val32: Int as uint32;
    val64: Int as int64;
    val257: Int as int257;

    init() {
        self.val8 = 1;
        self.val16 = -2;
        self.val32 = 3;
        self.val64 = -4;
        self.val257 = 5;
    }
}