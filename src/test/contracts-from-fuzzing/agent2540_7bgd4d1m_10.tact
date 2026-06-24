contract ManyFields {
    a: Int;
    b: Bool;
    c: Address;
    d: String;
    e: Slice;
    f: Cell;
    g: Int?;
    h: Bool?;
    i: String?;
    j: Slice;
    k: Cell;

    init() {
        self.a = 1;
        self.b = false;
        self.c = myAddress();
        self.d = "d";
        self.e = emptyCell().asSlice();
        self.f = emptyCell();
        self.g = null;
        self.h = null;
        self.i = null;
        self.j = emptyCell().asSlice();
        self.k = emptyCell();
    }
}