// contract with many optional primitive fields with default null (implicit)
contract OptPrim {
    oi: Int?;
    ob: Bool?;
    oa: Address?;
    oc: Cell?;
    os: String?;
    osl: Slice?;
    ob1: Builder?;

    init() {
        self.oi = null;
        self.ob = null;
        self.oa = null;
        self.oc = null;
        self.os = null;
        self.osl = null;
        self.ob1 = null;
    }
}
