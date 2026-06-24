// Test contract with many diverse persistent fields, no structs
contract FlatFields {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Int;
    h: Bool;
    i: String;

    init() {
        self.a = 1;
        self.b = false;
        self.c = "hi";
        self.d = null;
        self.e = true;
        self.f = null;
        self.g = 7;
        self.h = true;
        self.i = "zzz";
    }
}