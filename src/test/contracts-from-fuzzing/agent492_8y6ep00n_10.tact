contract TestContract {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: String;
    f: Int = 1;
    g: Bool = true;
    h: String = "x";
    
    init() {
        self.a = 10;
        self.b = false;
        self.c = null;
        self.d = true;
        self.e = "hello";
        self.f = 100;
        self.g = false;
        self.h = "world";
    }
}