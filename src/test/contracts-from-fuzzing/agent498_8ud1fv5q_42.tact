contract OptionalInitPartial {
    a: Int?;
    b: Bool?;
    c: String?;
    init() {
        self.a = null;
        self.b = null;
        // self.c left unassigned (which implicitly should be null)
    }
}