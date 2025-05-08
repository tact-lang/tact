contract TestContract {
    a: Int = 1;
    b: Bool = false;
    c: Address;
    d: Cell;
    e: Slice;
    f: String = "hello";

    init() {
        self.a = 42;
        self.b = true;
        self.c = myAddress();
        self.d = emptyCell();
        self.e = emptyCell().asSlice();
        self.f = "world";
    }
}
