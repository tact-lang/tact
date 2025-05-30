contract TestContract {
    x: Int as int64 = -1000;
    y: Int as uint64 = 1000;
    f: Bool = true;
    s: String = "test";
    addr: Address;

    init() {
        self.addr = myAddress();
    }
}