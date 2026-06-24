struct Big {
    a: Int;
    b: String;
    c: Cell;
    d: Slice;
}

contract MultiStorage {
    f1: Big;
    f2: Big;
    f3: Big;

    init() {
        self.f1 = Big{ a: 1, b: "one", c: emptyCell(), d: emptyCell().asSlice() };
        self.f2 = Big{ a: 2, b: "two", c: emptyCell(), d: emptyCell().asSlice() };
        self.f3 = Big{ a: 3, b: "three", c: emptyCell(), d: emptyCell().asSlice() };
    }
}