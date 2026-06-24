contract BoolAndInt {
    flag: Bool;
    num: Int;
    optnum: Int?;
    optflag: Bool?;

    init() {
        self.flag = true;
        self.num = 1234;
        self.optnum = null;
        self.optflag = false;
    }
}