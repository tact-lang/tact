contract ManyOptionals {
    oi: Int?;
    ob: Bool?;
    oa: Address?;
    oc: Cell?;
    os: Slice?;
    ostr: String?;

    init() {
        self.oi = null;
        self.ob = null;
        self.oa = null;
        self.oc = null;
        self.os = null;
        self.ostr = null;
    }
}