contract TestContract {
    flag: Bool;
    txt: String;
    addr: Address;
    optInt: Int?;
    optStr: String?;
    optBool: Bool?;
    optAddr: Address?;

    init() {
        self.flag = false;
        self.txt = "";
        self.addr = myAddress();
        self.optInt = null;
        self.optStr = null;
        self.optBool = null;
        self.optAddr = null;
    }
}