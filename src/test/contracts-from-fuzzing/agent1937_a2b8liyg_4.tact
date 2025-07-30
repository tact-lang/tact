contract ManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
    g: Bool?;
    h: Address?;
    i: String;
    j: Int;

    init() {
        self.a = 1;
        self.b = false;
        self.c = "hi";
        self.d = myAddress();
        self.e = emptyCell();
        self.f = self.e.asSlice();
        self.g = null;
        self.h = null;
        self.i = "bye";
        self.j = 42;
    }
}
