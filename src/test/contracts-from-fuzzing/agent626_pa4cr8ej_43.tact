contract CombinedTypes {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
    g: Builder;
    h: Int?;
    i: String?;
    j: Bool?;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "hi";
        self.d = myAddress();
        self.e = emptyCell();
        self.f = emptyCell().asSlice();
        self.g = beginCell();
        self.h = null;
        self.i = null;
        self.j = false;
    }
}