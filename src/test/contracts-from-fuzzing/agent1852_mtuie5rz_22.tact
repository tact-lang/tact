contract IntSerializationEdge {
    u1: Int as uint1;
    u4: Int as uint4;
    u7: Int as uint7;
    i1: Int as int1;
    i8: Int as int8;
    i257: Int as int257;

    init() {
        self.u1 = 1;
        self.u4 = 15;
        self.u7 = 127;
        self.i1 = -1;
        self.i8 = -128;
        self.i257 = -123456789012345678901234567890;
    }
}