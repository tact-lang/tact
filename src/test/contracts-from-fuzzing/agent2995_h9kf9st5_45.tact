contract ManyFieldsType {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
    g: String;
    h: Int;
    i: Bool;
    j: Address;
    k: Cell;
    l: String;

    init() {
        self.a = 1;
        self.b = false;
        self.c = "abc";
        self.d = emptyCell();
        self.e = emptyCell().asSlice();
        self.f = myAddress();
        self.g = "def";
        self.h = 2;
        self.i = true;
        self.j = myAddress();
        self.k = emptyCell();
        self.l = "ghi";
    }
}