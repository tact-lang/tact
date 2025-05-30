contract TestContract {
    a: Int; 
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
    g: Cell;
    h: Cell?;
    i: Slice;
    j: Slice?;
    k: Address;
    l: Address?;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = true;
        self.d = false;
        self.e = "abc";
        self.f = "def";
        self.g = emptyCell();
        self.h = emptyCell();
        self.i = emptyCell().asSlice();
        self.j = emptyCell().asSlice();
        self.k = myAddress();
        self.l = myAddress();
    }
}
