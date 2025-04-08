contract BoolAndOptional {
    flag1: Bool;
    optFlag: Bool?;
    flag2: Bool;

    init() {
        self.flag1 = true;
        self.optFlag = false;
        self.flag2 = true;
    }
}