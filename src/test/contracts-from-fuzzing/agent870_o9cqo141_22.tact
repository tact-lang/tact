contract SerialFormats {
    i4: Int as int4;
    u4: Int as uint4;
    i12: Int as int12;
    u12: Int as uint12;

    init() {
        self.i4 = 7;
        self.u4 = 5;
        self.i12 = 1000;
        self.u12 = 4000;
    }
}