contract TinySerialization {
    smallInt: Int as uint4;
    smallInt2: Int as uint7;
    negInt: Int as int4;
    boolBit: Bool;

    init() {
        self.smallInt = 5;
        self.smallInt2 = 64;
        self.negInt = -5;
        self.boolBit = true;
    }
}