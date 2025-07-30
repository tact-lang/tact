contract LongPrimitives {
    b: Bool;
    n: Int;
    a: Address;
    c: Cell;
    s: Slice;
    str: String;
    optInt: Int?;
    optBool: Bool?;
    optAddr: Address?;
    optCell: Cell?;
    optStr: String?;
    
    init() {
        self.b = true;
        self.n = 1;
        self.a = myAddress();
        self.c = emptyCell();
        self.s = emptyCell().asSlice();
        self.str = "hi";
        self.optInt = null;
        self.optBool = null;
        self.optAddr = null;
        self.optCell = null;
        self.optStr = null;
    }
}