contract OptionalStrings {
    a: String?;
    b: String?;

    init() {
        self.a = null;
        self.b = "hello";
    }
}