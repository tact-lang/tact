contract ManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Slice;
    e: Cell;
    f: Address;
    g: Bool?;
    h: Int?;
    i: String;
    j: Int;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "hi";
        self.d = emptyCell().asSlice();
        self.e = emptyCell();
        self.f = myAddress();
        self.g = null;
        self.h = 5;
        self.i = "bye";
        self.j = 99;
    }
}