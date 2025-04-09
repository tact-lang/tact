contract LongFieldList {
    a: Int;
    b: Int;
    c: Bool;
    d: String;
    e: Cell;
    f: Address;
    g: Int?;
    h: Bool?;
    i: String;
    j: Address;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = true;
        self.d = "Hi";
        self.e = emptyCell();
        self.f = myAddress();
        self.g = null;
        self.h = false;
        self.i = "again";
        self.j = myAddress();
    }
}