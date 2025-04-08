contract NarrowFields {
    flag1: Int as uint1 = 1;
    flag2: Int as uint1 = 0;
    counter: Int as uint8 = 255;
    smallSigned: Int as int4 = -7;

    init() {
        self.flag1 = 0;
    }
}