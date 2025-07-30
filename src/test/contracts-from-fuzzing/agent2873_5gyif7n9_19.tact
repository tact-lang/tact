contract OptionalAndDefault {
    a: Int?;
    b: Bool = true;
    c: String?;

    init() {
        self.a = null;
        self.c = null;
        self.b = false;
    }
}