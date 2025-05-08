contract ManyFields {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: String;
    f: Cell;
    g: Slice;
    h: Builder;
    i: Address;
    j: String;
    k: Int;

    init() {
        self.a = 1;
        self.b = true;
        self.c = null;
        self.d = false;
        self.e = "a";
        self.f = emptyCell();
        self.g = emptyCell().asSlice();
        self.h = beginCell();
        self.i = myAddress();
        self.j = "b";
        self.k = 42;
    }
}