contract LargeFields {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Builder;
    g: Address;
    h: Int?;
    i: Bool?;
    j: String?;
    k: Cell?;
    l: Slice?;
    m: Builder?;
    n: Address?;
    o: Nested;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "x";
        self.d = emptyCell();
        self.e = self.d.asSlice();
        self.f = beginCell();
        self.g = myAddress();
        self.h = null;
        self.i = null;
        self.j = null;
        self.k = null;
        self.l = null;
        self.m = null;
        self.n = null;
        self.o = Nested{
            x: 123,
            y: false,
            z: "nested"
        };
    }
}

struct Nested {
    x: Int;
    y: Bool;
    z: String;
}