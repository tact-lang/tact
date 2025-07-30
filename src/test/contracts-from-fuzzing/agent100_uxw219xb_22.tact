contract OptionalPrimitives {
    intOpt: Int?;
    boolOpt: Bool?;
    stringOpt: String?;

    init() {
        self.intOpt = 7;
        self.boolOpt = null;
        self.stringOpt = null;
    }
}