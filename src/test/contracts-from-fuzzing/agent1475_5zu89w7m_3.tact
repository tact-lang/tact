contract MultiField {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    sl: Slice;
    a: Address;
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
    optCell: Cell?;
    optAddress: Address?;

    init() {
        self.i = 1;
        self.b = true;
        self.s = "test";
        self.c = emptyCell();
        self.sl = emptyCell().asSlice();
        self.a = myAddress();
        self.optInt = 5;
        self.optBool = false;
        self.optStr = "opt";
        self.optCell = emptyCell();
        self.optAddress = myAddress();
    }
}