contract OnlyOptionals {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;

    init() {
        self.a = null;
        self.b = true;
        self.c = null;
        self.d = null;
    }
}