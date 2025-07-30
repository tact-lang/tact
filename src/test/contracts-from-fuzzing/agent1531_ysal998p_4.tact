contract ManyFields {
    a: Int;
    b: String;
    c: Bool;
    d: Address;
    e: Int;
    f: String;
    g: Bool;
    h: Address;
    i: Int;
    j: String;

    init() {
        self.a = 1;
        self.b = "b";
        self.c = true;
        self.d = myAddress();
        self.e = 2;
        self.f = "f";
        self.g = false;
        self.h = myAddress();
        self.i = 3;
        self.j = "j";
    }
}
