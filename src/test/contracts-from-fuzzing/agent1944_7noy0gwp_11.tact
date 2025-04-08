contract WithOptionalPrimitives {
    oi: Int?;
    ob: Bool?;
    os: String?;
    oc: Cell?;
    osl: Slice?;
    oa: Address?;

    init() {
        self.oi = null;
        self.ob = null;
        self.os = null;
        self.oc = null;
        self.osl = null;
        self.oa = null;
    }
}