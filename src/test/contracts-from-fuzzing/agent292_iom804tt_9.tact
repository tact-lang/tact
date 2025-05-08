contract ManyOptionals {
    a: Int?; b: Int?; c: Int?; d: Int?;
    e: Bool?; f: Bool?; g: Bool?; h: Bool?;
    s: String?; t: String?;

    init() {
        self.a = null; self.b = 1; self.c = null; self.d = 4;
        self.e = true; self.f = null; self.g = false; self.h = null;
        self.s = "hi"; self.t = null;
    }
}