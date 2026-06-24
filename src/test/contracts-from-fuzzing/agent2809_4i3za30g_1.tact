contract TestContract {
    a: Int;
    b: Bool;
    c: Address;
    d: String;
    e: Cell;
    f: Slice;
    g: Builder;

    init() {
        self.a = 1;
        self.b = true;
        self.c = myAddress();
        self.d = "Hello";
        self.e = emptyCell();
        self.f = self.e.asSlice();
        self.g = beginCell();
    }
}