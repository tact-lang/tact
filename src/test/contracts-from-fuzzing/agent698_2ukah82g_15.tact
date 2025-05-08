contract TestContract {
    a: Int;
    b: Bool;
    c: Int?;
    d: String;
    e: String?;
    f: Cell;
    g: Slice;
    h: Builder;
    i: Address;

    init() {
        self.a = 1;
        self.b = true;
        self.c = null;
        self.d = "hello";
        self.e = null;
        self.f = emptyCell();
        self.g = emptyCell().asSlice();
        self.h = beginCell();
        self.i = myAddress();
    }
}