contract FieldOrderTest {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Slice;
    f: Cell;
    init() {
        self.f = emptyCell();
        self.c = "X";
        self.a = 99;
        self.d = myAddress();
        self.e = emptyCell().asSlice();
        self.b = true;
    }
}
