contract WidePrimitives {
    a: Int;
    b: Bool;
    c: Address;
    d: Int?;
    e: Bool?;
    f: Address?;
    g: Slice;
    h: Slice?;
    i: Int;
    j: Int?;

    init() {
        self.a = 1;
        self.b = true;
        self.c = myAddress();
        self.d = null;
        self.e = false;
        self.f = null;
        self.g = emptyCell().asSlice();
        self.h = null;
        self.i = 77;
        self.j = 42;
    }
}
