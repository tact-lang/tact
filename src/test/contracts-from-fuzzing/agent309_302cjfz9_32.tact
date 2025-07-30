contract BigOptionalString {
    a: String?;
    b: String?;
    c: String?;

    init() {
        self.a = null;
        self.b = null;
        self.c = "some text";
    }
}