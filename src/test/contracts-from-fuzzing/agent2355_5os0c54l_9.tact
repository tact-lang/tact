contract OptionalInits {
    oi: Int? = null;
    ob: Bool? = null;
    os: String? = null;
    oa: Address? = null;
    oc: Cell? = null;
    osl: Slice? = null;

    init() {
        self.oi = 5;
        self.ob = true;
        self.os = "abc";
        self.oa = myAddress();
        self.oc = emptyCell();
        self.osl = emptyCell().asSlice();
    }
}