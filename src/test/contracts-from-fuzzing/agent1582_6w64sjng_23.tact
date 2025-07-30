contract OptionalDifferentOrder {
    a: Int?;
    b: String;
    c: Bool?;
    d: String?;
    init() {
        self.a = null; self.b = "hi"; self.c = null; self.d = null;
    }
}