contract OptionalPrimitives {
    ni: Int?;
    nb: Bool?;
    ns: String?;
    na: Address?;
    nc: Cell?;
    nsl: Slice?;
    init() {
        self.ni = null;
        self.nb = null;
        self.ns = null;
        self.na = null;
        self.nc = null;
        self.nsl = null;
    }
}