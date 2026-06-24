contract ManyBools {
    a: Bool = true;
    b: Bool = false;
    c: Bool = true;
    d: Bool = false;
    e: Bool = true;
    f: Bool = false;
    g: Bool = true;
    h: Bool = false;
    i: Bool = true;
    j: Bool = false;

    init() {
        self.a = false;
        self.b = true;
        self.c = false;
        self.d = true;
        self.e = false;
        self.f = true;
        self.g = false;
        self.h = true;
        self.i = false;
        self.j = true;
    }

    receive() {
        let _ = self.a;
        let _ = self.b;
        let _ = self.c;
        let _ = self.d;
        let _ = self.e;
        let _ = self.f;
        let _ = self.g;
        let _ = self.h;
        let _ = self.i;
        let _ = self.j;
    }
}