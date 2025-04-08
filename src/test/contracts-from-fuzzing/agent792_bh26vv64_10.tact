contract TestContract {
    a: Int?;
    b: Bool?;
    c: Cell?;
    d: Address?;

    init() {
        self.a = 10;
        self.b = null;
        self.c = emptyCell();
        self.d = null;
    }
}