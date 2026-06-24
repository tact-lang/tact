contract OptPrim {
    oi: Int?;
    ob: Bool?;
    os: String?;
    oc: Cell?;
    oa: Address?;

    init() {
        self.oi = null;
        self.ob = true;
        self.os = null;
        self.oc = emptyCell();
        self.oa = null;
    }
}
