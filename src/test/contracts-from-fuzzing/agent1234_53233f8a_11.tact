contract OnlyOptionals {
    oi: Int?;
    ob: Bool?;
    os: String?;
    oa: Address?;
    oc: Cell?;
    obld: Builder?;
    osl: Slice?;

    init() {
        self.oi = null;
        self.ob = null;
        self.os = null;
        self.oa = null;
        self.oc = null;
        self.obld = null;
        self.osl = null;
    }
}