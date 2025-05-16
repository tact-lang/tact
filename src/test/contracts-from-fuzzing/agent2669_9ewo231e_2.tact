contract TestContract {
    a: Int = 0;
    b: Bool = false;
    c: String = "";
    d: Address;
    e: Cell;
    f: Slice;
    g: Int?;

    init() {
        self.a = 10;
        self.b = true;
        self.c = "string";
        self.d = myAddress();
        self.e = emptyCell();
        self.f = self.e.asSlice();
        self.g = null;
    }
}
