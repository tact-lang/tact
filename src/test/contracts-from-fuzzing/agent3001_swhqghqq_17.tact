contract OptionalAfterDefaults {
    a: Int = 2;
    b: Bool = false;
    c: String?;

    init() {
        self.c = null;
    }
}
