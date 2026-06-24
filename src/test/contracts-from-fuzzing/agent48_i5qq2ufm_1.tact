contract TestSimpleFields {
    a: Int;
    b: Bool;
    c: Address;
    d: String;
    e: Cell;
    f: Builder;
    g: Slice;

    init() {
        self.a = 1;
        self.b = true;
        self.c = myAddress();
        self.d = "hello";
        self.e = emptyCell();
        self.f = beginCell();
        self.g = self.e.asSlice();
    }

    receive() {
        self.a = self.a + 1;
    }
}