contract LargeStringsAndNested {
    a: String;
    b: String;
    s: Cell;

    init() {
        self.a = "A string with some content and more content";
        self.b = "Another lengthy string to test storage behaviors";
        self.s = emptyCell();
    }
}