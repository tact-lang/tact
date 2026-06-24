contract BoolInts {
    flag: Bool;
    count: Int as uint4;
    big: Int;

    init() {
        self.flag = true;
        self.count = 13;
        self.big = 99999;
    }
}