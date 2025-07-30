contract TestManyScalars {
    a: Int; b: Int;
    c: Int; d: Int;
    e: Bool; f: Bool;
    g: Bool; h: Bool;
    i: Int?; j: Int?;
    k: Bool?; l: Bool?;

    init() {
        self.a = 1; self.b = 2;
        self.c = 3; self.d = 4;
        self.e = true; self.f = false;
        self.g = false; self.h = true;
        self.i = null; self.j = 42;
        self.k = true; self.l = null;
    }
}