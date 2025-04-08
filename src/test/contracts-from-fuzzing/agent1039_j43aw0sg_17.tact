contract TestContract {
    flag: Bool = true;
    num: Int as uint8 = 5;
    optStr: String? = null;
    addr: Address;

    init() {
        self.addr = myAddress();
    }
}