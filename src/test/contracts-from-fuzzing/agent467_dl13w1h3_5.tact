contract MultiPrimitiveFields {
    flag: Bool;
    num: Int;
    text: String;
    data: Cell;
    hash: Slice;
    addr: Address;

    init() {
        self.flag = true;
        self.num = 77;
        self.text = "Test";
        self.data = emptyCell();
        self.hash = emptyCell().asSlice();
        self.addr = myAddress();
    }
}
