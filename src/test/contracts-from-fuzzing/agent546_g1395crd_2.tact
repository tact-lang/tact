contract OptionalFields {
    oi: Int?;
    ob: Bool?;
    os: String?;
    oa: Address?;
    oc: Cell?;
    osl: Slice?;

    init() {
        self.oi = null;
        self.ob = null;
        self.os = null;
        self.oa = null;
        self.oc = null;
        self.osl = null;
    }
}
