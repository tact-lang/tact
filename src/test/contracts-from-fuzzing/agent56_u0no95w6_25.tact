contract InlineDefaults {
    a: Int = 5;
    b: Bool = true;
    s: String = "hi";

    init() {
        self.a = 6;
        self.b = false;
        self.s = "bye";
    }
}