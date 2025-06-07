contract ManyFields {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Bool;
    f: Bool;
    g: Bool;
    h: String;
    i: String;
    j: String;
    k: Address;

    init() {
        self.a = 1; self.b = 2; self.c = 3; self.d = 4;
        self.e = true; self.f = false; self.g = true;
        self.h = "h"; self.i = "i"; self.j = "j";
        self.k = myAddress();
    }
}