contract ManyPrimitiveFields {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
    g: Cell;
    h: Slice;
    i: Address;
    j: Int;
    k: Bool;
    l: String;
    
    init() {
        self.a = 1;
        self.b = 2;
        self.c = true;
        self.d = false;
        self.e = "hello";
        self.f = null;
        self.g = emptyCell();
        self.h = emptyCell().asSlice();
        self.i = myAddress();
        self.j = 10;
        self.k = true;
        self.l = "world";
    }
}