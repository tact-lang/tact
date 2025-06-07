contract OnlyOptionals {
    oi: Int?;
    ob: Bool?;
    os: String?;
    oc: Cell?;
    osa: Slice?;
    oaddr: Address?;

    init() {
        self.oi = null;
        self.ob = null;
        self.os = null;
        self.oc = null;
        self.osa = null;
        self.oaddr = null;
    }
}