contract ManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Builder;
    g: Address;
    h: String;
    i: Bool;
    j: Int;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "s";
        self.d = emptyCell();
        self.e = emptyCell().asSlice();
        self.f = beginCell();
        self.g = myAddress();
        self.h = "end";
        self.i = false;
        self.j = 123;
    }
}