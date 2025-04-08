contract TestStorage {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Address;
    f: Slice;
    g: Builder;
    h: String?;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "test";
        self.d = emptyCell();
        self.e = myAddress();
        self.f = emptyCell().asSlice();
        self.g = beginCell();
        self.h = null;
    }
}