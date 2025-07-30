contract ZeroDefaults {
    a: Int = 0;
    b: Int?;
    c: String?;

    init() {
        self.b = null;
        self.c = null;
    }
}
