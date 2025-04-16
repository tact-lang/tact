contract TestContract {
    a: Int = 1;
    b: Int? = null;
    c: Bool = true;
    d: Bool? = false;
    e: Address;
    f: String;
    g: Cell;
    h: Slice;
    i: Builder;

    init() {
        self.e = myAddress();
        self.f = "hello";
        self.g = emptyCell();
        self.h = emptyCell().asSlice();
        self.i = beginCell();
    }
}