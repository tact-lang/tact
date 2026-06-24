contract PrimitiveVarsTest {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;

    init() {
        self.a = 1;
        self.b = null;
        self.c = true;
        self.d = null;
        self.e = "hello";
        self.f = null;
    }

    receive() {
        let a = self.a;
        let b = self.b;
        let c = self.c;
        let d = self.d;
        let e = self.e;
        let f = self.f;
    }
}