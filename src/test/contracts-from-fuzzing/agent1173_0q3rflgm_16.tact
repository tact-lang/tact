contract Test {
    flag: Bool;
    num: Int;
    addr: Address;
    data: Slice;

    init() {
        self.flag = true;
        self.num = 42;
        self.addr = myAddress();
        self.data = emptyCell().asSlice();
    }
}
