contract OnlyOptionals {
    a: Int?;
    b: Bool?;
    c: Cell?;

    init() {
        self.a = null;
        self.b = true;
        self.c = null;
    }
}