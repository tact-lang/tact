contract ManyFieldsDirect {
    a: Int;
    b: Bool;
    c: Int?;
    d: String;
    e: Slice;
    f: Cell;
    g: Builder;
    h: Address;

    init() {
        self.a = 1;
        self.b = true;
        self.c = null;
        self.d = "hi";
        self.e = emptyCell().asSlice();
        self.f = emptyCell();
        self.g = beginCell();
        self.h = myAddress();
    }
}