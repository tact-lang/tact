contract OptionalPrimitives {
    oi: Int?;
    ob: Bool?;
    ostr: String?;
    oaddr: Address?;
    ocell: Cell?;

    init() {
        self.oi = null;
        self.ob = null;
        self.ostr = null;
        self.oaddr = null;
        self.ocell = null;
    }
}