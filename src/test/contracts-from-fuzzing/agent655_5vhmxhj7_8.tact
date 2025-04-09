contract TestContract {
    a: Int;
    b: String;
    c: Bool;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Address;
    h: Cell;
    i: Slice;

    init() {
        self.a = 0;
        self.b = "";
        self.c = false;
        self.d = null;
        self.e = null;
        self.f = null;
        self.g = myAddress();
        self.h = emptyCell();
        self.i = self.h.asSlice();
    }
}