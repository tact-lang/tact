contract OptionalPrimitives {
    intOpt: Int?;
    boolOpt: Bool?;
    addrOpt: Address?;
    strOpt: String?;
    slOpt: Slice?;
    clOpt: Cell?;

    init() {
        self.intOpt = null;
        self.boolOpt = null;
        self.addrOpt = null;
        self.strOpt = null;
        self.slOpt = null;
        self.clOpt = null;
    }
}
