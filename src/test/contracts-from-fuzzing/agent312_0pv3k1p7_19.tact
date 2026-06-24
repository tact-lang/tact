contract SerializationFormats {
    sint1: Int as int1;
    sint8: Int as int8;
    sint64: Int as int64;
    suint4: Int as uint4;
    suint32: Int as uint32;
    suint64: Int as uint64;

    init() {
        self.sint1 = -1;
        self.sint8 = -100;
        self.sint64 = -100000;
        self.suint4 = 15;
        self.suint32 = 100000;
        self.suint64 = 10000000000;
    }
}