contract TestContract {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Builder;
    f: Slice;
    g: String;
    h: Int?;

    init() {
        self.a = 1;
        self.b = true;
        self.c = myAddress();
        self.d = emptyCell();
        self.e = beginCell();
        self.f = emptyCell().asSlice();
        self.g = "test";
        self.h = null;
    }
}