contract OptionalFieldsDefaults {
    f1: Int? = null;
    f2: Bool?;
    f3: String? = "hi";

    init() {
        self.f2 = false;
    }
}