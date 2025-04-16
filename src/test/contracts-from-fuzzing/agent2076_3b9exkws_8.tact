contract TestContract {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Address;
    f: Slice;
    g: Builder;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "hello";
        self.d = emptyCell();
        self.e = myAddress();
        self.f = emptyCell().asSlice();
        self.g = beginCell();
    }
}