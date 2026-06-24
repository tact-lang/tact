contract ManyTypes {
    a: Int;
    b: Bool;
    c: String;
    d: Slice;
    e: Cell;
    f: Address;

    init() {
        self.a = -999;
        self.b = true;
        self.c = "yo";
        self.d = emptyCell().asSlice();
        self.e = emptyCell();
        self.f = myAddress();
    }
}