contract Test {
    i: Int;
    b: Bool;
    a: Address;
    c: Cell;
    s: Slice;
    t: String;

    init() {
        self.i = 1;
        self.b = true;
        self.a = myAddress();
        self.c = emptyCell();
        self.s = emptyCell().asSlice();
        self.t = "hello";
    }
}