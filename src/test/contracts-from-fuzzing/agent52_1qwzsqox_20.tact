contract TestContract {
    num: Int as coins;
    optnum: Int?;
    flg: Bool = false;

    init() {
        self.num = 1234567890;
        self.optnum = null;
        self.flg = true;
    }
}
