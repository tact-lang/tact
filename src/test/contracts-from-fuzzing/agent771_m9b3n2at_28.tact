contract MixedPersistent {
    intval: Int = 0;
    flag: Bool = false;
    addr: Address;
    optStr: String?;
    optAddr: Address?;

    init() {
        self.intval = 10;
        self.flag = true;
        self.addr = myAddress();
        self.optStr = null;
        self.optAddr = null;
    }
}