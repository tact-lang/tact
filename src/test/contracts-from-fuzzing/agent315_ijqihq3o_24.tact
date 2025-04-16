contract StringsVsCells {
    s1: String;
    s2: String?;
    c1: Cell;
    c2: Cell;

    init() {
        self.s1 = "hello";
        self.s2 = null;
        self.c1 = emptyCell();
        self.c2 = emptyCell();
    }
}