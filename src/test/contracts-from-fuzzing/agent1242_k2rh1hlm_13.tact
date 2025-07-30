contract UnusualOrder {
    a: Int as uint64;
    b: Bool;
    c: Int as uint4;
    d: Address;
    e: Cell;
    f: String;

    init() {
        self.a = 123;
        self.b = false;
        self.c = 3;
        self.d = myAddress();
        self.e = emptyCell();
        self.f = "hi";
    }
}