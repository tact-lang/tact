contract ManyFields {
    a: Int = 1;
    b: Bool = true;
    c: Int?;
    d: Bool?;
    e: Address;
    f: String;
    g: Int?;
    h: Bool?;
    i: Slice;
    j: Cell;

    init() {
        self.a = 42;
        self.b = false;
        self.c = null;
        self.d = true;
        self.e = myAddress();
        self.f = "hi";
        self.g = 10;
        self.h = null;
        self.i = emptyCell().asSlice();
        self.j = emptyCell();
    }
}