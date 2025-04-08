// Test large chain of persistent fields with optionals
contract LotsOptionals {
    a: Int?; b: Int?; c: Int?; d: Int?; e: Int?;
    f: Int?; g: Int?; h: Int?; i: Int?; j: Int?;

    init() {
        self.a = null; self.b = 1; self.c = null; self.d = 2; self.e = 3;
        self.f = null; self.g = 4; self.h = null; self.i = 5; self.j = null;
    }
}
