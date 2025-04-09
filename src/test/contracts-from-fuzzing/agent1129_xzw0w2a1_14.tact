contract ZeroDefaults {
    a: Int;
    b: Bool;
    c: Int?;
    d: Cell;

    init() {
        self.a = 0;
        self.b = false;
        self.c = null;
        self.d = emptyCell();
    }
}