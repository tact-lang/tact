contract ManyOptionals {
    oi: Int?;
    ob: Bool?;
    ostr: String?;
    oaddr: Address?;
    ocl: Cell?;
    obui: Builder?;
    osl: Slice?;

    init() {
        self.oi = null;
        self.ob = true;
        self.ostr = null;
        self.oaddr = myAddress();
        self.ocl = emptyCell();
        self.obui = beginCell();
        self.osl = emptyCell().asSlice();
    }
}
