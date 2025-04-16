contract OptionalStrings {
    a: String?;
    b: String?;
    c: String?;

    init() {
        self.a = "x";
        self.b = null;
        self.c = "y";
    }
}
