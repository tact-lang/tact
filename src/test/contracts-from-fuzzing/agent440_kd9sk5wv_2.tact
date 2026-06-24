contract ManyFields {
    a: Int;
    b: Bool;
    c: Cell;
    d: Slice;
    e: Address;
    f: String;
    g: Int?;
    h: Bool?;
    i: Cell?;
    j: Slice?;
    k: Address?;
    l: String?;

    init() {
        self.a = 1;
        self.b = true;
        self.c = emptyCell();
        self.d = emptyCell().asSlice();
        self.e = myAddress();
        self.f = "str";
        self.g = 2;
        self.h = false;
        self.i = emptyCell();
        self.j = emptyCell().asSlice();
        self.k = myAddress();
        self.l = "opt";
    }

    receive() {}
}