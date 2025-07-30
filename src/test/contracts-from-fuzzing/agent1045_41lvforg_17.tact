// long contract with many primitive mixed variables

contract TestContract {
    a: Int; b: Int as uint8; c: Int as int16;
    d: Bool; e: Bool; f: Bool;
    g: String; h: String; i: String;
    j: Int?; k: Bool?; l: String?;

    init() {
        self.a = 1; self.b = 2; self.c = 3;
        self.d = true; self.e = false; self.f = true;
        self.g = "A"; self.h = "B"; self.i = "C";
        self.j = null; self.k = null; self.l = null;
    }
}