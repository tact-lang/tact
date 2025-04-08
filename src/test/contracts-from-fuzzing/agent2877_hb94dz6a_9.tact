contract LongList {
    a: Int;
    b: Int;
    c: Bool;
    d: Address;
    e: Cell;
    f: Int;
    g: Bool;
    h: Address;
    i: Int;
    j: Int;
    
    init() {
        self.a = 1;
        self.b = 2;
        self.c = true;
        self.d = myAddress();
        self.e = emptyCell();
        self.f = 3;
        self.g = false;
        self.h = myAddress();
        self.i = 4;
        self.j = 5;
    }
}