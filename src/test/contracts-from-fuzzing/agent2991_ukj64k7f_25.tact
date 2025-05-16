contract Test {
    var1: Int as uint4;
    var2: Int as uint4;

    init() {
        self.var1 = 16;  // above uint4 max
        self.var2 = -1;  // negative in uint4
    }
}