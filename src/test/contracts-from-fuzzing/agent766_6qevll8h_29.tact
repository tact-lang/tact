contract Mix {
    a: Int = 1;
    b: String;
    c: Bool;
    d: Address;
    e: Cell;
    f: Slice;
    g: Builder;
    h: Int?;
    i: Bool?;
    j: String?;

    init() {
        self.b = "hello";
        self.c = true;
        self.d = myAddress();
        self.e = emptyCell();
        self.f = emptyCell().asSlice();
        self.g = beginCell();
        self.h = null;
        self.i = false;
        self.j = null;
    }
}