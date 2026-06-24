contract TestContract {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;

    init() {
        self.a = 10;
        self.b = false;
        self.c = "hello";
        self.d = emptyCell();
        self.e = self.d.asSlice();
        self.f = myAddress();
    }
}