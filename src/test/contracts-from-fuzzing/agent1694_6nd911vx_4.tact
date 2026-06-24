contract LongFields {
    a: Int;
    b: Bool;
    c: Cell;
    d: Address;
    e: String;

    init() {
        self.a = 1;
        self.b = true;
        self.c = emptyCell();
        self.d = myAddress();
        self.e = "hi";
    }
}