contract LargeSetOfOptionalFields {
    a: Int?; b: Int?; c: Int?; d: Int?; e: Int?;
    f: Int?; g: Int?; h: Int?; i: Int?; j: Int?;
    k: Int?; l: Int?; m: Int?; n: Int?; o: Int?;
    p: Int?; q: Int?; r: Int?; s: Int?; t: Int?;

    init() {
        self.a = null; self.b = 1; self.c = null; self.d = 3; self.e = 4;
        self.f = null; self.g = 6; self.h = 7; self.i = null; self.j = 9;
        self.k = null; self.l = null; self.m = 12; self.n = null; self.o = 14;
        self.p = 15; self.q = null; self.r = 17; self.s = 18; self.t = null;
    }
}