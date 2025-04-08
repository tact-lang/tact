contract TestContract {
    a: Int = 1;
    b: Bool = true;
    c: Address;
    d: Cell;
    e: Slice;
    f: String = "test";

    init() {
        self.c = myAddress();
        self.d = emptyCell();
        self.e = emptyCell().asSlice();
        self.a = 123;
        self.b = false;
        self.f = "updated";
    }

    receive() {}
}