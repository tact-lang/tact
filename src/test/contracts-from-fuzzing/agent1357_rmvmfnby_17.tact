contract TinySerials {
    smallPos: Int as uint1 = 1;
    smallNeg: Int as int1 = 0;
    tinyInt: Int as int2 = -1;
    tinyUint: Int as uint2 = 3;
    tiny4s: Int as int4 = -8;
    tiny4u: Int as uint4 = 15;

    init() {
        self.smallPos = 1;
        self.smallNeg = 0;
        self.tinyInt = -1;
        self.tinyUint = 3;
        self.tiny4s = -8;
        self.tiny4u = 15;
    }
}