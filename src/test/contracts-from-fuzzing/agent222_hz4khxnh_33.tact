contract LargeMix {
    i1: Int = 1;
    i2: Int = 2;
    boo1: Bool?;
    boo2: Bool = true;
    s1: String?;
    s2: String = "x";
    oi: Int?;
    os: String?;
    ob: Bool?;

    receive() {
        self.boo1 = null;
        self.oi = 999;
        self.ob = true;
        self.i1 = 22;
        self.i2 = 33;
        self.boo2 = false;
        self.s1 = null;
        self.s2 = "zz";
        self.os = "foo";
    }
}