contract TestContract {
    a: Int;
    b: Bool;
    c: Cell;

    init() {
        self.a = 1;
        self.b = true;
        self.c = emptyCell();
    }
}