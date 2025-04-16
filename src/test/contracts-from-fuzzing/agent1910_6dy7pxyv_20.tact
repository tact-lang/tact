contract OptionalDefaults {
    f1: Int?;
    f2: Bool? = null;
    f3: Address? = null;

    init() {
        self.f1 = null;
    }
}
