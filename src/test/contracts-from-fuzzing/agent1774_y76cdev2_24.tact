contract OptionalsMix {
    oi: Int?;
    ob: Bool?;
    os: String?;
    oa: Address?;
    oc: Cell?;
    osl: Slice?;

    init() {
        self.oi = 10;
        self.ob = null;
        self.os = null;
        self.oa = myAddress();
        self.oc = emptyCell();
        self.osl = emptyCell().asSlice();
    }
}
