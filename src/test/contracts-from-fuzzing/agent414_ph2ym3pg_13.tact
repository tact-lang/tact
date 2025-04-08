contract ManyOptionals {
    a: Int?; b: Int?; c: Int?; d: Int?; e: Bool?; f: Bool?; g: String?; h: String?;
    i: Address?; j: Address?; k: Cell?; l: Cell?;
    init() {
        self.a = null; self.b = null; self.c = null; self.d = null;
        self.e = false; self.f = true; self.g = null; self.h = null;
        self.i = null; self.j = null; self.k = null; self.l = null;
    }
}
