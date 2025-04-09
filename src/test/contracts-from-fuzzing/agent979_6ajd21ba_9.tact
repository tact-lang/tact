contract OptionalPrimitives {
    oa: Address?;
    os: String?;
    oc: Cell?;
    ob: Bool?;
    oi: Int?;

    init() {
        self.oa = null;
        self.os = null;
        self.oc = null;
        self.ob = null;
        self.oi = null;
    }
}