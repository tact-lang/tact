contract NoDefaults {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;

    init() {
        self.a = 0;
        self.b = false;
        self.c = "";
        self.d = myAddress();
        self.e = emptyCell();
    }
}