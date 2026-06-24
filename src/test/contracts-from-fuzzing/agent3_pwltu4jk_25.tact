// Contract with many primitive + optional mix fields, no defaults
contract MixFields {
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
        self.b = false;
        self.c = myAddress();
        self.d = emptyCell();
        self.e = emptyCell().asSlice();
        self.f = "z";
        self.g = 7;
        self.h = true;
        self.i = myAddress();
        self.j = emptyCell();
        self.k = emptyCell().asSlice();
        self.l = "y";
    }
}