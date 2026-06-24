// Fuzzing edge case: very large number of persistent fields with mixed types
contract ManyFields {
    a: Int = 1;
    b: Bool = true;
    c: Int = 2;
    d: Bool = false;
    e: Int = 3;
    f: Bool = true;
    g: Int = 4;
    h: Bool = false;
    i: Int = 5;
    j: Bool = true;

    init() {
        self.a = 10;
        self.b = false;
        self.c = 20;
        self.d = true;
        self.e = 30;
        self.f = false;
        self.g = 40;
        self.h = true;
        self.i = 50;
        self.j = false;
    }

    receive() {
        self.a = self.a + 1;
    }
}