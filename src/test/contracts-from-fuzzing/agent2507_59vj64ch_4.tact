contract ManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Slice;
    e: Cell;
    f: Int?;
    g: Bool?;
    h: Address;
    i: String;
    j: Cell;
    
    init() {
        self.a = 1;
        self.b = true;
        self.c = "abc";
        self.d = emptyCell().asSlice();
        self.e = emptyCell();
        self.f = null;
        self.g = null;
        self.h = myAddress();
        self.i = "def";
        self.j = emptyCell();
    }
}