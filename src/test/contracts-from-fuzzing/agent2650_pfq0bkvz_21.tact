// Test long contract with many mixed fields
contract ManyFields {
    a: Int; b: Int; c: Int;
    d: Bool; e: Bool; f: Bool;
    g: String; h: String; i: String;
    j: Int?; k: Bool?; l: String?;

    init() {
        self.a = 1; self.b = 2; self.c = 3;
        self.d = true; self.e = false; self.f = true;
        self.g = "a"; self.h = "b"; self.i = "c";
        self.j = null; self.k = null; self.l = null;
    }
}