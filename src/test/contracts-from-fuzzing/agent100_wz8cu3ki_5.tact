contract Test6 {
    a: Int = 1;
    b: Bool = false;
    c: String = "abc";
    // no default for d
    d: Cell;

    init() {
        self.d = emptyCell();
    }
}