contract AddressBoolIntFields {
    addr: Address;
    flag: Bool;
    num: Int;
    init() {
        self.addr = myAddress();
        self.flag = true;
        self.num = 55;
    }
}