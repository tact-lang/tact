contract EmptyVsNull {
    opt1: String?;
    opt2: Int?;
    flag: Bool;

    init() {
        self.opt1 = null;
        self.opt2 = null;
        self.flag = true;
    }
}
