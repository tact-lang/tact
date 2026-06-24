// Many optional fields interleaved with other types
contract TestContract {
    a: Int?;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: Bool;
    g: String?;
    h: String;
    i: Int?;
    j: Bool?;

    init() {
        self.a = null;
        self.b = true;
        self.c = "c";
        self.d = 7;
        self.e = null;
        self.f = false;
        self.g = null;
        self.h = "h";
        self.i = null;
        self.j = true;
    }
}