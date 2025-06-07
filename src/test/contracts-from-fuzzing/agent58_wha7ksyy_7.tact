contract ManyFields {
    a: Int = 1;
    b: Int = 2;
    c: Bool = true;
    d: Int = 4;
    e: Bool = false;
    f: Int = 6;
    g: Bool = true;
    h: Int = 8;
    i: Bool = false;
    j: Int = 10;
    k: Bool = true;
    l: Int = 12;
    m: Bool = false;
    n: Int = 14;
    o: Bool = true;
    p: Int = 16;
    q: Bool = false;
    r: Int = 18;
    s: Bool = true;
    t: Int = 20;

    receive() {
        let sum = self.a + self.b + self.d + self.f + self.h + self.j + self.l + self.n + self.p + self.r + self.t;
    }
}