contract TestContract {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Int = 0;
    h: Bool = true;
    i: String = "default";
    
    init() {
        self.a = 1;
        self.b = false;
        self.c = "x";
        self.d = null;
        self.e = true;
        self.f = null;
        self.g = 10;
        self.h = false;
        self.i = "changed";
    }
}