contract InlineDefaults {
    a: Int = 2;
    b: Bool = true;
    c: String = "abc";

    init() {
        self.a = 5;
        self.b = false;
        self.c = "def";
    }
}