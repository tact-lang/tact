contract WeirdOrder {
    b: Bool;
    i: Int;
    s: String;
    a: Address;
    c: Cell;
    sl: Slice;
    optB: Bool?;
    optInt: Int?;
    
    init() {
        self.b = true;
        self.i = 0;
        self.s = "";
        self.a = myAddress();
        self.c = emptyCell();
        self.sl = emptyCell().asSlice();
        self.optB = null;
        self.optInt = null;
    }
}