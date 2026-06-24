contract OptionalStrings {
    a: String?;
    b: String?;
    c: String?;

    init() {
        self.a = null;
        self.b = "abc";
        self.c = null;
    }
}