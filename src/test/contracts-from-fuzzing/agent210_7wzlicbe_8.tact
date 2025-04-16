contract OptionalPrimitives {
    intOpt: Int?;
    boolOpt: Bool?;
    stringOpt: String?;
    addressOpt: Address?;

    init() {
        self.intOpt = null;
        self.boolOpt = null;
        self.stringOpt = null;
        self.addressOpt = null;
    }
}