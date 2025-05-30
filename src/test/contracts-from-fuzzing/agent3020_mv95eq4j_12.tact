contract OptionalFieldsDefaults {
    f1: Int?;
    f2: Bool? = null;
    f3: Address?;
    f4: Cell?;

    init() {
        self.f1 = null;
        self.f3 = null;
        self.f4 = null;
    }
}
