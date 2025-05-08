contract OptionalPrimitivesTopLevel {
    oi: Int?;
    ob: Bool?;
    os: String?;
    oa: Address?;
    oc: Cell?;
    oslice: Slice?;
    init() {
        self.oi = null;
        self.ob = null;
        self.os = null;
        self.oa = null;
        self.oc = null;
        self.oslice = null;
    }
}