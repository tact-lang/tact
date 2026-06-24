// Large contract, contract fields style
contract LargeMix {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
    g: Int;
    h: Bool;
    i: String;
    j: Int;
    k: Int?;

    init() {
        self.a = 1;
        self.b = null;
        self.c = true;
        self.d = null;
        self.e = "E";
        self.f = null;
        self.g = 7;
        self.h = false;
        self.i = "I";
        self.j = 100;
        self.k = null;
    }
    
    receive() {}
}