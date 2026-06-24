contract LargeMixedOpt {
    i1: Int;
    s1: String;
    b1: Bool;
    addr1: Address?;
    i2: Int;
    s2: String;
    b2: Bool;
    addr2: Address?;

    init() {
        self.i1 = 1;
        self.s1 = "a";
        self.b1 = true;
        self.addr1 = null;
        self.i2 = 2;
        self.s2 = "b";
        self.b2 = false;
        self.addr2 = null;
    }
}