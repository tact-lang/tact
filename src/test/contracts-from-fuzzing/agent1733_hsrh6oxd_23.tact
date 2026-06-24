contract TestContract {
    a: Int = 1;
    b: Bool = false;
    c: String = "hi";
    d: Address;
    e: Cell;
    f: Slice;
    g: Int?;
    h: Bool?;
    i: String?;

    init() {
        self.d = myAddress();
        self.e = emptyCell();
        self.f = emptyCell().asSlice();
        self.g = null;
        self.h = null;
        self.i = null;
    }
}