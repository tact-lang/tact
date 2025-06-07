contract Test11 {
    varA: Int = 1;
    varB: Int as uint8 = 255;
    varC: Int as int64 = -123456;
    varD: Int as coins = ton("1");

    init() {
        self.varA = 10;
        self.varB = 200;
        self.varC = -99999;
        self.varD = ton("0.5");
    }
}
