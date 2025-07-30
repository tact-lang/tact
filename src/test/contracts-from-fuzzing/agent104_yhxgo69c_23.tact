contract TestContract {
    val: Int;
    optVal: Int?;
    str: String;
    optStr: String?;
    flag: Bool;
    optFlag: Bool?;
    init() {
        self.val = 7;
        self.optVal = null;
        self.str = "hi";
        self.optStr = null;
        self.flag = true;
        self.optFlag = null;
    }
}