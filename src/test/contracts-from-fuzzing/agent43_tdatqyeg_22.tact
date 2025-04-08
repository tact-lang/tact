contract ManyFieldsOptionalAndSet {
    a: Int?; b: Bool?; c: Address?; d: String?; e: Cell?; f: Slice?;
    g: Int?; h: Bool?; i: Address?; j: String?; k: Cell?; l: Slice?;

    init() {
        self.a = null; self.b = null; self.c = null; self.d = null; self.e = null; self.f = null;
        self.g = null; self.h = null; self.i = null; self.j = null; self.k = null; self.l = null;
    }
}