contract OnlyOptionals {
    a: Int?;
    b: Address?;
    c: Cell?;
    d: String?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = null;
    }
}
