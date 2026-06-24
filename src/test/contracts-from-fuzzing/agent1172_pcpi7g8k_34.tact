contract OptionalMix {
    oi: Int?;
    ob: Bool?;
    os: String?;
    oc: Cell?;
    osl: Slice?;
    obui: Builder?;

    init() {
        self.oi = null;
        self.ob = true;
        self.os = null;
        self.oc = null;
        self.osl = null;
        self.obui = null;
    }
}