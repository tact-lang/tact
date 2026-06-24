contract WideTypes {
    i: Int;
    b: Bool;
    a: Address;
    c: Cell;
    s: Slice;
    str: String;
    optInt: Int?;
    optBool: Bool?;
    optAddr: Address?;
    optCell: Cell?;
    optSlice: Slice?;
    optStr: String?;

    init() {
        self.i = 1;
        self.b = true;
        self.a = myAddress();
        self.c = emptyCell();
        self.s = emptyCell().asSlice();
        self.str = "abc";
        self.optInt = null;
        self.optBool = null;
        self.optAddr = null;
        self.optCell = null;
        self.optSlice = null;
        self.optStr = null;
    }
}