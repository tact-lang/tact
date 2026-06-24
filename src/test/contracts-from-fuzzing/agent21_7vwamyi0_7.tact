contract Test {
    a: Int;
    b: Bool;
    c: Int?;
    d: map<Int, Int>;
    e: Int as int64;
    f: Int as uint8;
    g: map<Address, Int>;
    h: Address;
    i: Cell;
    j: String;
    k: Int?;
    l: map<Int, Bool>;

    init() {
        self.a = 1;
        self.b = true;
        self.c = null;
        self.d = emptyMap();
        self.e = 42;
        self.f = 7;
        self.g = emptyMap();
        self.h = myAddress();
        self.i = emptyCell();
        self.j = "test";
        self.k = null;
        self.l = emptyMap();
    }
}