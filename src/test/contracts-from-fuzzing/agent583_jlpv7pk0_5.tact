contract ManyFields {
    a: Int = 1;
    b: Bool = false;
    c: Address;
    d: Cell;
    e: Slice;
    f: String = "hi";
    g: Int?;
    h: Bool?;
    i: String?;
    j: Address?;
    k: Cell?;
    l: Slice?;

    init() {
        self.c = myAddress();
        self.d = emptyCell();
        self.e = emptyCell().asSlice();
        self.g = 7;
        self.h = null;
        self.i = "hello";
        self.j = null;
        self.k = null;
        self.l = emptyCell().asSlice();
    }
}