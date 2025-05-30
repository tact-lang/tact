contract OnlyOptionals {
    a: Int?;
    s: String?;
    b: Bool?;
    init() {
        self.a = null;
        self.s = null;
        self.b = null;
    }
}