contract OptionalDefaults {
    oi: Int?;
    ob: Bool?;
    os: String?;
    oc: Cell?;
    oa: Address?;
    init() {
        self.oi = null;
        self.ob = null;
        self.os = null;
        self.oc = null;
        self.oa = null;
    }
}