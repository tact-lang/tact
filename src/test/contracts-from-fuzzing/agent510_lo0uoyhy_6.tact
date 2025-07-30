contract OptionalFields {
    intOpt: Int?;
    boolOpt: Bool?;
    addrOpt: Address?;
    stringOpt: String?;

    init() {
        self.intOpt = null;
        self.boolOpt = null;
        self.addrOpt = null;
        self.stringOpt = null;
    }
}