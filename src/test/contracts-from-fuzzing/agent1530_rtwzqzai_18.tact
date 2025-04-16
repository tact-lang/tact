contract TestContract {
    flag: Bool = true;
    number: Int = 42;
    optStr: String? = null;
    addr: Address;
    slice: Slice;

    init() {
        self.addr = myAddress();
        self.slice = emptyCell().asSlice();
    }
}
