contract DeepOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = emptyCell();
    }
}
