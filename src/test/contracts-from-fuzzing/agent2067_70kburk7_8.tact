contract OptionalPrimitives {
    oi: Int?;
    ob: Bool?;
    oc: Cell?;
    os: Slice?;
    ostr: String?;

    init() {
        self.oi = null;
        self.ob = true;
        self.oc = emptyCell();
        self.os = emptyCell().asSlice();
        self.ostr = null;
    }
}