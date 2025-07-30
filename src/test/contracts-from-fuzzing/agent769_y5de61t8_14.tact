contract OptionalPrimitives {
    oi: Int?;
    ob: Bool?;
    oa: Address?;
    oc: Cell?;
    os: String?;

    init() {
        self.oi = null;
        self.ob = true;
        self.oa = null;
        self.oc = null;
        self.os = "hello";
    }
}