contract VariousPrimitives {
    a: Int;
    b: Bool;
    c: Address;
    d: Slice;
    e: Cell;
    f: String;

    init() {
        self.a = 1;
        self.b = true;
        self.c = myAddress();
        self.d = emptyCell().asSlice();
        self.e = emptyCell();
        self.f = "hello";
    }
}
