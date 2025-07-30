contract TinyIntsOverflow {
    smallPos: Int as uint4;
    smallNeg: Int as int4;

    init() {
        self.smallPos = 20;  // invalid: 20 does not fit uint4 (max 15)
        self.smallNeg = -9;  // invalid: -9 < -(2^3)= -8
    }
}