contract ManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: Cell;
    g: Address;
    h: Slice;
    i: String;
    j: Int;

    init() {
        self.a = 1;
        self.b = false;
        self.c = "hi";
        self.d = null;
        self.e = true;
        self.f = emptyCell();
        self.g = myAddress();
        self.h = self.f.asSlice();
        self.i = "test";
        self.j = 42;
    }
}