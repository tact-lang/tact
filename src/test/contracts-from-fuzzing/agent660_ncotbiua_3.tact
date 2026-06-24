contract Test {
    a: Int = 1;
    b: Bool = false;
    c: Address;
    d: String = "Hello";
    e: Cell;
    f: Slice;
    g: Builder;

    init() {
        self.a = 10;
        self.b = true;
        self.c = myAddress();
        self.d = "World";
        self.e = emptyCell();
        self.f = emptyCell().asSlice();
        self.g = beginCell();
    }

    receive() {}
}