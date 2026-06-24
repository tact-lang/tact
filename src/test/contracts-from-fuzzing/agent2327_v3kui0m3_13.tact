contract OptionalDefaults {
    a: Int?;
    b: Bool? = true;
    c: String? = "hi";

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
    }
}
