contract LargeOptionals {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
    e: Int?;
    f: Bool?;
    g: Bool?;
    h: Bool?;
    i: String?;
    j: String?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = null;
        self.e = null;
        self.f = null;
        self.g = null;
        self.h = null;
        self.i = null;
        self.j = null;
    }

    receive() {
        let _ = self.a;
        let _ = self.b;
        let _ = self.j;
    }
}
