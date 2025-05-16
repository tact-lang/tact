contract AddressTypes {
    addr: Address;
    sl: Slice;
    cl: Cell;
    str: String;
    flag: Bool;
    init() {
        self.addr = myAddress();
        self.sl = self.addr.asSlice();
        self.cl = emptyCell();
        self.str = "hello";
        self.flag = true;
    }
}