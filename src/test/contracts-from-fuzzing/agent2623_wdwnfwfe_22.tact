contract TestContract {
    a: Int = 1;
    b: Bool = true;
    s: String = "s";
    c: Cell;

    init() {
        self.c = emptyCell();
    }
}