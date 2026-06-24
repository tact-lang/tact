contract TinyInts {
    smallPos: Int as uint4;
    smallNeg: Int as int4;

    init() {
        self.smallPos = 7;
        self.smallNeg = -8;
    }
}