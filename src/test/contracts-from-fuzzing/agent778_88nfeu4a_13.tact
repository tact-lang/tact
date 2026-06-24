contract OptionalAndDefaultVars {
    a: Int?;
    b: Bool = true;
    c: Int = 5;

    init() {
        self.a = null;
        self.b = false;
        self.c = 42;
    }
}