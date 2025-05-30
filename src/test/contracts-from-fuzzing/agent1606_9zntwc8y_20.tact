contract ManyPrims {
    a: Int;
    b: String;
    c: Bool;
    d: Int as uint32;
    e: String?;
    f: Bool?;

    init() {
        self.a=10; self.b="x"; self.c=true; self.d=20; self.e=null; self.f=null;
    }

    receive() {
        let _a = self.a;
        let _b = self.b;
        let _c = self.c;
        let _d = self.d;
        let _e = self.e;
        let _f = self.f;
    }
}