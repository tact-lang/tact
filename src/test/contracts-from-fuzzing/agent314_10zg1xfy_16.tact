// contract with many primitive fields
contract ManyPrimitiveFields {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: String;
    f: String?;
    g: Cell;
    h: Slice;
    i: Address;
    j: Cell?;
    k: Slice?;
    l: Address?;

    init() {
        self.a = 1;
        self.b = true;
        self.c = null;
        self.d = null;
        self.e = "hi";
        self.f = null;
        self.g = emptyCell();
        self.h = emptyCell().asSlice();
        self.i = myAddress();
        self.j = null;
        self.k = null;
        self.l = null;
    }
}