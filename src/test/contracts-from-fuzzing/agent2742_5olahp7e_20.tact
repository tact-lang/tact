contract MixedTypesFields {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: Address;
    f: Address?;
    g: String;
    h: String?;
    i: Cell;
    j: Cell?;
    k: Slice;
    l: Slice?;

    init() {
        self.a = 1; self.b = null;
        self.c = true; self.d = null;
        self.e = myAddress(); self.f = null;
        self.g = "hi"; self.h = null;
        self.i = emptyCell(); self.j = null;
        self.k = self.i.asSlice(); self.l = null;
    }
}