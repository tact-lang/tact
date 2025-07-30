contract OptionalOnlyFields {
    intOpt: Int?;
    boolOpt: Bool?;
    stringOpt: String?;

    init() {
        self.intOpt = null;
        self.boolOpt = null;
        self.stringOpt = null;
    }
}
