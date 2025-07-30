contract BigOptionalBlock {
    a: Int?; b: Int?; c: Int?; d: Int?; e: Int?;
    f: Bool?; g: Bool?; h: Bool?; i: Bool?; j: Bool?;
    s1: String?; s2: String?; s3: String?;

    init() {
        self.a = null; self.b = 1; self.c = null; self.d = 3; self.e = 4;
        self.f = false; self.g = null; self.h = true; self.i = null; self.j = null;
        self.s1 = "x"; self.s2 = null; self.s3 = "y";
    }
}