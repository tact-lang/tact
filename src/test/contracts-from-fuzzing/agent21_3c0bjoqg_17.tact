contract AllFieldTypes {
    n: Int;
    b: Bool;
    s: String;
    cl: Cell;
    sl: Slice;
    a: Address;
    nopt: Int?;
    bopt: Bool?;
    sopt: String?;
    clopt: Cell?;
    slopt: Slice?;
    aopt: Address?;

    init() {
        self.n = 1;
        self.b = false;
        self.s = "string";
        self.cl = emptyCell();
        self.sl = emptyCell().asSlice();
        self.a = myAddress();
        self.nopt = null;
        self.bopt = null;
        self.sopt = null;
        self.clopt = null;
        self.slopt = null;
        self.aopt = null;
    }
}