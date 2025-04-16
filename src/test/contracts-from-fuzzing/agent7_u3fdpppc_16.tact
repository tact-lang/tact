contract OptionalPrimitives {
    oi: Int?;
    ob: Bool?;
    os: String?;
    oa: Address?;

    init() {
        self.oi = null;
        self.ob = false;
        self.os = null;
        self.oa = null;
    }
}