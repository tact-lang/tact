contract AllTypesMix {
    ai: Int;
    ab: Bool;
    astr: String;
    aad: Address;
    ac: Cell;
    aslice: Slice;
    abld: Builder;
    oi: Int?;
    ob: Bool?;
    ostr: String?;
    oad: Address?;
    oc: Cell?;
    oslice: Slice?;
    obld: Builder?;

    init() {
        self.ai = 5;
        self.ab = false;
        self.astr = "hello";
        self.aad = myAddress();
        self.ac = emptyCell();
        self.aslice = emptyCell().asSlice();
        self.abld = beginCell();
        self.oi = null;
        self.ob = null;
        self.ostr = null;
        self.oad = null;
        self.oc = null;
        self.oslice = null;
        self.obld = null;
    }
}