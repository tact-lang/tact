contract PrimitivesStorage {
    a: Int;
    b: Bool;
    c: Cell;
    d: Slice;
    e: Address;
    s: String;

    init() {
        self.a = 42;
        self.b = true;
        self.c = emptyCell();
        self.d = emptyCell().asSlice();
        self.e = myAddress();
        self.s = "hello";
    }
}