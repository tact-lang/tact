contract TopLevels {
    count: Int = 1;
    flag: Bool = false;
    addr: Address;

    init() {
        self.addr = myAddress();
    }
}