// contract with many persistent primitives
contract TestContract {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: Address;
    f: Address?;
    g: Cell;
    h: Cell?;
    i: Slice;
    j: Slice?;
    k: String;
    l: String?;

    init() {
        self.a = 1;
        self.b = null;
        self.c = true;
        self.d = false;
        self.e = myAddress();
        self.f = null;
        self.g = emptyCell();
        self.h = null;
        self.i = emptyCell().asSlice();
        self.j = null;
        self.k = "test";
        self.l = null;
    }
}