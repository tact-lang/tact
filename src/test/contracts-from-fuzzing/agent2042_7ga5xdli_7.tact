contract ManyPrimitives {
    num: Int;
    flag: Bool;
    addr: Address;
    s: String;
    c: Cell;
    sl: Slice;

    init() {
        self.num = 7;
        self.flag = true;
        self.addr = myAddress();
        self.s = "str";
        self.c = emptyCell();
        self.sl = emptyCell().asSlice();
    }
}