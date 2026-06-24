contract ManyOptionalsDirect {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Slice?;

    init() {
        self.a = 1;
        self.b = false;
        self.c = "opt";
        self.d = emptyCell();
        self.e = emptyCell().asSlice();
    }
}