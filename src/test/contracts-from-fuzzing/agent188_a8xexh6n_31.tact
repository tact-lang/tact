contract OptionalStringNested {
    a: String?;
    b: String? = null;

    init() {
        self.a = null;
        self.b = "hi";
    }
}