// contract with many primitive fields
contract ManyPrimitives {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
    g: Int;
    h: Int?;
    i: Bool;
    j: String;

    init() {
        self.a = 1;
        self.b = null;
        self.c = false;
        self.d = null;
        self.e = "e";
        self.f = null;
        self.g = 2;
        self.h = 3;
        self.i = true;
        self.j = "j";
    }
}