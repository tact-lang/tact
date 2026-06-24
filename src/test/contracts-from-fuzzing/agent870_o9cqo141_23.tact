contract ComposeSerial {
    s: Slice;
    b: Builder;
    c: Cell;
    str: String;
    addr: Address;
    bFlag: Bool;
    iNum: Int;

    init() {
        self.s = emptyCell().asSlice();
        self.b = beginCell();
        self.c = emptyCell();
        self.str = "text";
        self.addr = myAddress();
        self.bFlag = true;
        self.iNum = 42;
    }
}