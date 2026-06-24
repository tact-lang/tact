contract OptDefaults {
    a: Int?;
    b: String? = null;
    c: Bool?;

    init() {
        self.a = null;
        self.c = null;
    }
}