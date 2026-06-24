contract ManyPrimitives {
    a: Int;
    b: Int as uint32;
    c: Bool;
    d: Address;
    e: Cell;
    f: Slice;
    g: String;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = true;
        self.d = myAddress();
        self.e = emptyCell();
        self.f = emptyCell().asSlice();
        self.g = "text";
    }
}