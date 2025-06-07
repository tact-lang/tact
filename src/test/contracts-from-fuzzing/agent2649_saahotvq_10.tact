contract OptionalFieldWithDefault {
    intOpt: Int? = null;

    init() {
        self.intOpt = 42;
    }
}