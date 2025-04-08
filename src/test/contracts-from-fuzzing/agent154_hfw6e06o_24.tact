contract OptionalStrings {
    a: String?;
    b: String?;

    init() {
        self.a = "hello";
        self.b = null;
    }
}