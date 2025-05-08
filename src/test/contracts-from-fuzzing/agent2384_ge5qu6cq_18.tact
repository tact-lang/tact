contract OnlyPrimitives {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    a: Address;

    init() {
        self.i = 1;
        self.b = true;
        self.s = "hi";
        self.c = emptyCell();
        self.a = myAddress();
    }
}