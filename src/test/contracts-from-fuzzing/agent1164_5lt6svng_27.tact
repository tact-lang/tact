contract OptionalAfterDefaults {
    a: Int = 1;
    b: String = "hi";
    c: Bool?;
    d: Int?;

    init() {
        self.c = null;
        self.d = null;
    }
}