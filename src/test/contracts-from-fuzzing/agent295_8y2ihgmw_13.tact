contract DefaultsMix {
    a: Int = 10;
    b: Bool;
    c: String = "hello";
    d: Cell;
    e: Int;

    init() {
        self.b = true;
        self.d = emptyCell();
        self.e = 42;
    }
}