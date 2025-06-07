contract ManyBoolIntOpt {
    a: Bool; b: Int; c: Bool?; d: Int?;
    e: Bool; f: Int; g: Bool?; h: Int?;
    i: Bool; j: Int; k: Bool?; l: Int?;

    init() {
        self.a = true; self.b = 1; self.c = null; self.d = null;
        self.e = false; self.f = 2; self.g = true; self.h = null;
        self.i = true; self.j = 3; self.k = null; self.l = 77;
    }
}