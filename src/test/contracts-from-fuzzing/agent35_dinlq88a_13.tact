contract TestContract {
    a: Int = 0;
    b: Bool = false;
    c: String = "";
    d: Int? = null;
    e: Bool? = null;
    f: String? = null;
    g: Int = 1;
    h: Bool = true;
    i: String = "hello";
    j: Int? = 42;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "world";
        self.d = null;
        self.e = false;
        self.f = null;
        self.g = 2;
        self.h = false;
        self.i = "!";
        self.j = null;
    }
}