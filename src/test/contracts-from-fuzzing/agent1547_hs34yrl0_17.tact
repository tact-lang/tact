contract OptionalDefaults {
    a: Int? = null;
    b: Bool? = true;
    c: String?;

    init() {
        self.c = "set at init";
    }
}