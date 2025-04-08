contract EmptyDefaults {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Address;

    init() {
        self.a = 0;
        self.b = false;
        self.c = "";
        self.d = emptyCell();
        self.e = myAddress();
    }
}
