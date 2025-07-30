contract TestContract {
    a: Int;
    b: Int?;
    c: map<Int, Bool>;
    d: Address;
    e: map<Address, Int>;
    f: Cell;
    g: Bool;
    h: Cell?;
    i: map<Int, Cell>;
    j: Bool?;
    init() {
        self.a = 1;
        self.b = null;
        self.c = emptyMap();
        self.d = myAddress();
        self.e = emptyMap();
        self.f = emptyCell();
        self.g = true;
        self.h = null;
        self.i = emptyMap();
        self.j = null;
    }
}