contract ComplexMixed {
    a: Int;
    b: Bool?;
    c: Cell;
    d: String?;
    e: Address;
    f: Int?;
    g: Cell?;
    h: Bool;
    i: String;
    j: Address?;
    
    init() {
        self.a = 123;
        self.b = null;
        self.c = emptyCell();
        self.d = null;
        self.e = myAddress();
        self.f = null;
        self.g = null;
        self.h = false;
        self.i = "zzz";
        self.j = null;
    }
}
