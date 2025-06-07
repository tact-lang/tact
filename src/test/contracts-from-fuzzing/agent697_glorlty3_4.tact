contract ManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Cell;
    f: Slice;
    g: Address;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "test";
        self.d = null;
        self.e = emptyCell();
        self.f = emptyCell().asSlice();
        self.g = myAddress();
    }
}