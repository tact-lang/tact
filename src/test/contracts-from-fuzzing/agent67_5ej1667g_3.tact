contract TestContract {
    flag: Bool;
    number: Int;
    optStr: String?;
    addr: Address;
    init() {
        self.flag = true;
        self.number = 42;
        self.optStr = null;
        self.addr = myAddress();
    }
}