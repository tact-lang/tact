contract TenPrimitives {
    a: Int; b: Int; c: Int;
    d: Bool; e: Bool;
    f: Address;
    g: Cell;
    h: String;
    i: Int?;
    j: Bool?;

    init() {
        self.a = 1; self.b = 2; self.c = 3;
        self.d = true; self.e = false;
        self.f = myAddress();
        self.g = emptyCell();
        self.h = "hi";
        self.i = null;
        self.j = null;
    }
}