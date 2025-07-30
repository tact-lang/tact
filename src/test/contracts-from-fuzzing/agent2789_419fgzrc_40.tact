contract OptionalBoolIntDefaults {
    intOpt: Int? = null;
    boolOpt: Bool? = null;

    init() {
        self.intOpt = 10;
        self.boolOpt = null;
    }
}
