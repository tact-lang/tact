contract OptionalAsState {
    a: Int?;
    b: Bool?;
    s: String?;

    init() {
        self.a = null;
        self.b = true;
        self.s = "abc";
    }
}
