contract OptionalAfterDefaults {
    a: Int = 8;
    b: Bool = false;
    c: String?;

    init() {
        self.c = null;
    }
}