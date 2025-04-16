contract ManyOptionals {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Slice?;
    f: String?;

    init() {
        self.a = null;
        self.b = false;
        self.c = null;
        self.d = emptyCell();
        self.e = emptyCell().asSlice();
        self.f = "abc";
    }
}