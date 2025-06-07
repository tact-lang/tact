contract AllOptionals {
    oi: Int?;
    ob: Bool?;
    os: String?;
    oc: Cell?;
    oa: Address?;
    osl: Slice?;

    init() {
        self.oi = null;
        self.ob = null;
        self.os = null;
        self.oc = null;
        self.oa = null;
        self.osl = null;
    }
}
