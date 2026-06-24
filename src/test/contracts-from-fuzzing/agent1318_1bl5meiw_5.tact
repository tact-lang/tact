contract ManyFields {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Slice;
    f: String;
    g: Int?;
    h: Bool?;
    i: Address?;
    j: Cell?;
    k: Slice?;
    l: String?;

    init() {
        self.a = 1;
        self.b = true;
        self.c = myAddress();
        self.d = emptyCell();
        self.e = emptyCell().asSlice();
        self.f = "test";
        self.g = 2;
        self.h = false;
        self.i = myAddress();
        self.j = emptyCell();
        self.k = emptyCell().asSlice();
        self.l = "optional";
    }
}