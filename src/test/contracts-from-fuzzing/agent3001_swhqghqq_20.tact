struct IntSerialStruct {
    val1: Int as uint1;
    val4: Int as uint4;
    val8: Int as uint8;
    val16: Int as int16;
    val32s: Int as int32;
    val32u: Int as uint32;
    val64s: Int as int64;
    val64u: Int as uint64;
}

contract IntSerialStructContract {
    vals: IntSerialStruct;

    init() {
        self.vals = IntSerialStruct{
            val1:1,
            val4:7,
            val8:255,
            val16:-12345,
            val32s:-123456,
            val32u:4000000000,
            val64s:-123456789012345,
            val64u:123456789012345
        };
    }
}
