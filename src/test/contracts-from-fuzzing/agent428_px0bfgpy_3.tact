// very long contract with many primitive fields
contract ManyFields {
    a: Int;
    b: Bool;
    c: Int;
    d: Bool;
    e: String;
    f: Address;
    g: Cell;
    h: Slice;
    i: String;
    j: Cell;
    k: Bool;
    l: Int;
    m: String;
    n: Address;
    o: Int;

    init() {
        self.a = 1;
        self.b = true;
        self.c = 2;
        self.d = false;
        self.e = "text";
        self.f = myAddress();
        self.g = emptyCell();
        self.h = emptyCell().asSlice();
        self.i = "another";
        self.j = emptyCell();
        self.k = true;
        self.l = 1234;
        self.m = "more";
        self.n = myAddress();
        self.o = 999;
    }
}
