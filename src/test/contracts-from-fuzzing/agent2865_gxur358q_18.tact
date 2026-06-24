contract OptionalAndDefault {
    a: Int?;
    b: Bool = true;
    c: String?;
    d: Int = 5;

    init() {
        self.a = 1;
        self.c = null;
    }
}