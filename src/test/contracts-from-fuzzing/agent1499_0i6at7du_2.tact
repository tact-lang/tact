contract OptFields {
    oi: Int?;
    ob: Bool?;
    oc: Cell?;
    os: Slice?;
    oa: Address?;
    ostring: String?;
    init() {
        self.oi = null;
        self.ob = null;
        self.oc = null;
        self.os = null;
        self.oa = null;
        self.ostring = null;
    }
    receive() {}
}