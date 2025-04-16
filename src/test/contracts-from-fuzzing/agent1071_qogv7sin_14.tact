contract OptionalAndDefault {
    a: Int?;
    b: Bool? = null;
    s: String? = "hello";

    init() {
        self.a = null;
        self.b = false;
        self.s = null;
    }
}