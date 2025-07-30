contract MixTypes {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Slice;
    f: Builder;
    g: String;
    h: Int?;
    i: Bool?;
    j: Address?;
    k: Cell?;
    l: String?;

    init() {
        self.a = 1;
        self.b = false;
        self.c = myAddress();
        self.d = emptyCell();
        self.e = emptyCell().asSlice();
        self.f = beginCell();
        self.g = "ggg";
        self.h = 11;
        self.i = true;
        self.j = myAddress();
        self.k = emptyCell();
        self.l = "lll";
    }
}