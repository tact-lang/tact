contract ManyBools {
    a: Bool = false;
    b: Bool = true;
    c: Bool = false;
    d: Bool = true;
    e: Bool = false;
    f: Bool = true;

    init() {
        self.a = true;
        self.b = false;
        self.c = true;
        self.d = false;
        self.e = true;
        self.f = false;
    }

    receive() {
        let _ = self.a;
        let _ = self.b;
        let _ = self.c;
        let _ = self.d;
        let _ = self.e;
        let _ = self.f;
    }
}