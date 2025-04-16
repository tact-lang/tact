contract ManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "hey";
        self.d = myAddress();
        self.e = emptyCell();
        self.f = emptyCell().asSlice();
    }
}
