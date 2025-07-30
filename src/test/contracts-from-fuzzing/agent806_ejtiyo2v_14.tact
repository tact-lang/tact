contract TestContract {
    num: Int;
    optNum: Int?;
    flag: Bool;
    optFlag: Bool?;
    txt: String;
    optTxt: String?;
    addr: Address;
    optAddr: Address?;
    init() {
        self.num = 1;
        self.optNum = null;
        self.flag = false;
        self.optFlag = null;
        self.txt = "x";
        self.optTxt = null;
        self.addr = myAddress();
        self.optAddr = null;
    }
}