contract ManyBoolInt {
    a: Bool; b: Int;
    c: Bool?; d: Int?;
    e: Bool; f: Int;
    g: Bool?; h: Int?;
    i: Bool; j: Int;

    init() {
        self.a = true; self.b = 1;
        self.c = false; self.d = null;
        self.e = true; self.f = 2;
        self.g = null; self.h = 3;
        self.i = false; self.j = 4;
    }
}