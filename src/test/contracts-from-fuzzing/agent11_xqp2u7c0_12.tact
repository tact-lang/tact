contract OptionalPrimitiveFields {
    oi: Int?;
    ob: Bool?;
    os: String?;
    oc: Cell?;
    osl: Slice?;
    oa: Address?;

    init() {
        self.oi = null;
        self.ob = true;
        self.os = null;
        self.oc = emptyCell();
        self.osl = null;
        self.oa = myAddress();
    }
}