contract TestContract {
    zero: Int as uint32 = 0;
    negOne: Int = -1;
    maxUint: Int as uint4 = 15;
    minInt: Int as int4 = -8;
    big: Int = 123456789;

    init() {
        self.zero = 0;
        self.negOne = -1;
        self.maxUint = 15;
        self.minInt = -8;
        self.big = 987654321;
    }
}
