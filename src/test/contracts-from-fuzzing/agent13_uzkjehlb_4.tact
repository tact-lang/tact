contract ManyTypesStorage {
    i: Int;
    b: Bool;
    s: String;
    o: Int?;
    c: Cell;
    sl: Slice;
    addr: Address;
    strOpt: String?;
    boolOpt: Bool?;

    init() {
        self.i = 1;
        self.b = true;
        self.s = "hi";
        self.o = null;
        self.c = emptyCell();
        self.sl = emptyCell().asSlice();
        self.addr = myAddress();
        self.strOpt = null;
        self.boolOpt = true;
    }
}