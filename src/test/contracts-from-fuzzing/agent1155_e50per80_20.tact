contract InitDefaults {
    a: Int = 10;
    b: Bool;
    c: String = "hello";
    d: Cell;

    init() {
        self.b = true;
        self.d = emptyCell();
    }
}
