contract OptionalFields {
    intOpt: Int?;
    boolOpt: Bool?;
    stringOpt: String?;
    addressOpt: Address?;

    init() {
        self.intOpt = null;
        self.boolOpt = true;
        self.stringOpt = null;
        self.addressOpt = myAddress();
    }
}