contract TestContract {
    s: String;
    b: Bool;
    i: Int;
    c: Cell;
    sl: Slice;
    a: Address;

    init() {
        self.s = "abc";
        self.b = false;
        self.i = 123;
        self.c = emptyCell();
        self.sl = emptyCell().asSlice();
        self.a = myAddress();
    }
}