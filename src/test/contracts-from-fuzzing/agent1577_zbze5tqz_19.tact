contract TestContract {
    a1: Int;    b1: Bool?; c1: String;
    a2: Int?;   b2: Bool;  c2: String?;
    a3: Int;    b3: Bool?; c3: String;
    a4: Int?;   b4: Bool;  c4: String?;
    init() {
        self.a1 = 1;    self.b1 = null; self.c1 = "a";
        self.a2 = null; self.b2 = true; self.c2 = null;
        self.a3 = 3;    self.b3 = null; self.c3 = "c";
        self.a4 = null; self.b4 = false;self.c4 = null;
    }
}