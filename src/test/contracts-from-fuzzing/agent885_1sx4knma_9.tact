contract TestContract {
    a: Int = 0;
    b: Bool = false;
    c: String = "";
    d: Int? = null;
    e: Bool? = null;
    f: String? = null;
    g: Int = -1;
    h: Bool = true;
    i: String = "hello";

    init() {
        self.a = 1;
        self.b = true;
        self.c = "c";
        self.d = 2;
        self.e = false;
        self.f = "f";
        self.g = -2;
        self.h = false;
        self.i = "world";
    }
}