contract OptionalPrimitiveFields {
    intOpt: Int?;
    boolOpt: Bool?;
    strOpt: String?;
    addrOpt: Address?;

    init() {
        self.intOpt = null;
        self.boolOpt = null;
        self.strOpt = null;
        self.addrOpt = null;
    }
}