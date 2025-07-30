contract DifferentDefaults {
    a: Int = 42;
    b: Bool = true;
    c: Address;
    d: Cell;
    e: Slice;
    f: String;
    init() {
        self.c = myAddress();
        self.d = emptyCell();
        self.e = emptyCell().asSlice();
        self.f = "hello";
    }
}