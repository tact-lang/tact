contract OptionalInitializer {
    intOpt: Int?;
    boolOpt: Bool?;
    strOpt: String?;

    init() {
        self.intOpt = 5;
        self.boolOpt = true;
        self.strOpt = "x";
    }
}