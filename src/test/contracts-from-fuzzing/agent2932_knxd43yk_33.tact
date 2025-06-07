contract SomeStructs {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
    optCell: Cell?;
    optSlice: Slice?;

    init() {
        self.a = 1;
        self.b = false;
        self.c = "s";
        self.d = emptyCell();
        self.e = emptyCell().asSlice();
        self.optInt = null;
        self.optBool = null;
        self.optStr = null;
        self.optCell = null;
        self.optSlice = null;
    }
}