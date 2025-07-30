contract TestContract {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Builder;
    f: Slice;
    g: String;

    init() {
        self.a = 42;
        self.b = true;
        self.c = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");
        self.d = emptyCell();
        self.e = beginCell();
        self.f = emptyCell().asSlice();
        self.g = "world";
    }
}