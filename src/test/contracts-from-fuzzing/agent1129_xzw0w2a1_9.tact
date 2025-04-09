contract OptionalPrimitives {
    oi: Int?;
    ob: Bool?;
    os: String?;
    oa: Address?;
    oc: Cell?;
    osl: Slice?;

    init() {
        self.oi = null;
        self.ob = true;
        self.os = "hello";
        self.oa = null;
        self.oc = emptyCell();
        self.osl = null;
    }
}