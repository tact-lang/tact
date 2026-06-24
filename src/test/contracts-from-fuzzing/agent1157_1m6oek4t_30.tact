contract ManyParamsTest(
    a: Int,
    b: Bool,
    c: String,
    d: Int?,
    e: String?,
    f: Bool?,
    g: Int,
    h: Bool,
    i: String,
    j: Int?,
    k: String?,
    l: Bool?
) {
    receive() {
        let _ = self.a; let _ = self.b; let _ = self.c;
        let _ = self.d; let _ = self.e; let _ = self.f;
        let _ = self.g; let _ = self.h; let _ = self.i;
        let _ = self.j; let _ = self.k; let _ = self.l;
    }
}