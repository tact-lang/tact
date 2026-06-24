contract IntSerializationTest {
    val1: Int as uint1;
    val4: Int as uint4;
    val8: Int as uint8;
    val16: Int as int16;
    val32s: Int as int32;
    val32u: Int as uint32;
    val64s: Int as int64;
    val64u: Int as uint64;

    init() {
        self.val1 = 1;
        self.val4 = 7;
        self.val8 = 255;
        self.val16 = -12345;
        self.val32s = -123456;
        self.val32u = 4000000000;
        self.val64s = -123456789012345;
        self.val64u = 123456789012345;
    }
}
