contract IntBoolStringCombi {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Int;

    init() {
        self.a = 1;
        self.b = false;
        self.c = "hi";
        self.d = null;
        self.e = null;
        self.f = null;
        self.g = 777;
    }

    receive() {
        let _ = self.a;
        let _ = self.b;
        let _ = self.c;
        let _ = self.d;
        let _ = self.e;
        let _ = self.f;
        let _ = self.g;
    }
}
