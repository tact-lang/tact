contract Test18 {
    flag: Bool = true;
    optNum: Int? = null;
    optStr: String? = null;
    addr: Address;

    init() {
        self.addr = myAddress();
    }
}
