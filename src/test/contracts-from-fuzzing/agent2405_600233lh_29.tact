contract IntSerialization {
    i8: Int as int8;
    u4: Int as uint4;
    i250: Int as int250;
    u120: Int as uint120;

    init() {
        self.i8 = 127;
        self.u4 = 15;
        self.i250 = -3333;
        self.u120 = 123456789;
    }
}