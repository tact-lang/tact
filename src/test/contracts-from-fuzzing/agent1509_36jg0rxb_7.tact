contract ManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
    f: Builder?;
    g: Slice?;

    init() {
        self.a = 1;
        self.b = false;
        self.c = "opt";
        self.d = myAddress();
        self.e = emptyCell();
        self.f = beginCell();
        self.g = emptyCell().asSlice();
    }
}
