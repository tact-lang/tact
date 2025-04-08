contract LargeFlat {
    a: Int = 1;
    b: Bool = true;
    c: String = "c";
    d: Int?;
    e: Bool?;
    f: String?;
    g: Cell;
    h: Slice;
    i: Cell?;
    j: Slice?;

    init() {
        self.d = null;
        self.e = false;
        self.f = null;
        self.g = emptyCell();
        self.h = emptyCell().asSlice();
        self.i = emptyCell();
        self.j = emptyCell().asSlice();
    }
}