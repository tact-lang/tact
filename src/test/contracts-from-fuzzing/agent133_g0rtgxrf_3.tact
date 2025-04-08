contract ManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Slice;
    e: Cell;
    f: Address;
    g: Int?;
    h: Bool?;
    i: String?;
    j: Address?;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "hello";
        self.d = emptyCell().asSlice();
        self.e = emptyCell();
        self.f = myAddress();
        self.g = null;
        self.h = null;
        self.i = null;
        self.j = null;
    }
}
