contract ManyPrimitives {
    num1: Int;
    num2: Int as uint32;
    flg: Bool;
    addr: Address;
    txt: String;
    sl: Slice;
    cl: Cell;
    bld: Builder;

    init() {
        self.num1 = 1;
        self.num2 = 10;
        self.flg = false;
        self.addr = myAddress();
        self.txt = "txt";
        self.sl = emptyCell().asSlice();
        self.cl = emptyCell();
        self.bld = beginCell();
    }
}
