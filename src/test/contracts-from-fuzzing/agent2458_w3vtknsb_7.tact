// Large contract with many primitive fields
contract ManyPrimitives {
    a: Int;
    b: Int;
    c: Bool;
    d: String;
    e: Address;
    f: Cell;
    g: Slice;
    h: Bool;
    i: String;
    j: Int;
    k: Int;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = true;
        self.d = "abc";
        self.e = myAddress();
        self.f = emptyCell();
        self.g = emptyCell().asSlice();
        self.h = false;
        self.i = "xyz";
        self.j = 100;
        self.k = 200;
    }
}