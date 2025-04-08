contract WithStringAndAddress {
    s: String;
    a: Address;
    c: Cell;
    b: Bool;
    i: Int;

    init() {
        self.s = "hi";
        self.a = myAddress();
        self.c = emptyCell();
        self.b = true;
        self.i = 123;
    }
}