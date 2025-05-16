contract TestContract {
    a: Bool;
    b: Int;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
    g: Builder;

    init() {
        self.a = true;
        self.b = 42;
        self.c = "Test";
        self.d = myAddress();
        self.e = emptyCell();
        self.f = emptyCell().asSlice();
        self.g = beginCell();
    }

    receive() {}
}