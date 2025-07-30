contract TestContract {
    x: Int;
    y: Bool;
    z: Address;
    s: String;
    c: Cell;
    b: Builder;
    sl: Slice;
    optInt: Int?;
    optBool: Bool?;
    optAddress: Address?;
    sOpt: String?;
    cOpt: Cell?;
    bOpt: Builder?;
    slOpt: Slice?;

    init() {
        self.x = 1;
        self.y = true;
        self.z = myAddress();
        self.s = "test";
        self.c = emptyCell();
        self.b = beginCell();
        self.sl = emptyCell().asSlice();
        self.optInt = null;
        self.optBool = null;
        self.optAddress = null;
        self.sOpt = null;
        self.cOpt = null;
        self.bOpt = null;
        self.slOpt = null;
    }
}