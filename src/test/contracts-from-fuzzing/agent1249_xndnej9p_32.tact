contract SerializerVariants {
    i_def: Int;
    i8: Int as int8;
    i16: Int as int16;
    u4: Int as uint4;
    u62: Int as uint62;

    init() {
        self.i_def = 0;
        self.i8 = 0;
        self.i16 = 0;
        self.u4 = 0;
        self.u62 = 0;
    }
}