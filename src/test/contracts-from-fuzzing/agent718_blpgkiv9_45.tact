contract MixedOptionals {
    a: Int?;
    b: Bool;
    c: String?;
    d: Cell;
    e: Address?;
    init() {
        self.a = null;
        self.b = false;
        self.c = null;
        self.d = emptyCell();
        self.e = null;
    }
}