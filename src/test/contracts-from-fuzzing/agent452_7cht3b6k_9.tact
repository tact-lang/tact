contract Test9 {
    i1: Int as uint64;
    i2: Int as int32;
    i3: Int as uint4;
    i4: Int as int1;
    flag: Bool;
    text: String;
    opt: Int?;
    init() {
        self.i1 = 1;
        self.i2 = -5;
        self.i3 = 15;
        self.i4 = 1;
        self.flag = true;
        self.text = "ser";
        self.opt = null;
    }
}
