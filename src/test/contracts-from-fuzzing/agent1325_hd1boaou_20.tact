contract TestContract {
    flag: Bool;
    num: Int;
    optFlag: Bool?;
    optNum: Int?;

    init() {
        self.flag = true;
        self.num = 42;
        self.optFlag = null;
        self.optNum = null;
    }

    receive() {
        self.flag = !self.flag;
        self.num += 1;
        self.optFlag = true;
        self.optNum = 100;
    }
}