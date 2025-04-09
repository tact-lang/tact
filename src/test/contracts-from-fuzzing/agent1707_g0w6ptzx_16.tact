contract BoolIntCombo {
    flag: Bool;
    num: Int as uint4;

    init() {
        self.flag = true;
        self.num = 10;
    }
}