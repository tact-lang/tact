contract MixedTypes {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
    g: Cell;
    h: Slice;
    i: Cell?;
    j: Slice?;
    k: Address;
    l: Address?;

    init() {
        self.a = 1;
        self.b = null;
        self.c = true;
        self.d = null;
        self.e = "hi";
        self.f = null;
        self.g = emptyCell();
        self.h = emptyCell().asSlice();
        self.i = null;
        self.j = null;
        self.k = myAddress();
        self.l = null;
    }

    receive() {}
}
