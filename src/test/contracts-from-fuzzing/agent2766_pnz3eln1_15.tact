contract OptionalDefaults {
    optVal1: Int?;
    optVal2: Bool? = true;
    optVal3: String? = null;
    optVal4: Address? = null;

    init() {
        self.optVal1 = null;
        self.optVal2 = true;
        self.optVal3 = null;
        self.optVal4 = null;
    }
}