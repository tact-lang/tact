contract ManyOptionalBools {
    a: Bool? = null;
    b: Bool? = null;
    c: Bool? = null;
    d: Bool? = null;
    e: Bool? = null;
    f: Bool? = null;

    init() {
        self.a = true;
        self.b = false;
        self.c = null;
        self.d = true;
        self.e = false;
        self.f = null;
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