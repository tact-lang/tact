contract MixedOptionals {
    a: Int?;
    b: Bool;
    c: String?;
    d: Address;
    e: Slice?;
    f: Cell;

    init() {
        self.a = null;
        self.b = true;
        self.c = "hi";
        self.d = myAddress();
        self.e = null;
        self.f = emptyCell();
    }
}