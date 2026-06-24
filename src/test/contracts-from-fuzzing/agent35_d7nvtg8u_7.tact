contract AllPrimTypes {
    i: Int;
    b: Bool;
    a: Address;
    c: Cell;
    s: String;
    sb: Slice;
    optI: Int?;
    optB: Bool?;
    optA: Address?;
    optC: Cell?;
    optS: String?;
    optSb: Slice?;

    init() {
        self.i = -12;
        self.b = true;
        self.a = myAddress();
        self.c = emptyCell();
        self.s = "hello";
        self.sb = emptyCell().asSlice();
        self.optI = null;
        self.optB = null;
        self.optA = null;
        self.optC = null;
        self.optS = null;
        self.optSb = null;
    }
}