contract ComplexStorage {
    // Mix optional nested struct, optional primitive, nested optional
    a: Int?;
    b: String?;
    c: Bool?;
    d: Int;
    e: String;
    f: Bool;
    g: Cell?;
    h: Slice;
    i: Address?;

    init() {
        self.a = null;
        self.b = "hello";
        self.c = true;
        self.d = 5;
        self.e = "world";
        self.f = false;
        self.g = null;
        self.h = emptyCell().asSlice();
        self.i = null;
    }
}
