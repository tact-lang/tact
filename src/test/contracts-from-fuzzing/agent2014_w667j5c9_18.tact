contract OptionalFields {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;

    init() {
        self.a = 1;
        self.b = true;
        self.c = null;
        self.d = null;
    }
}