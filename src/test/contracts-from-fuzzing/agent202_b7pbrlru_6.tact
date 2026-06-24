contract LargeFieldList {
    a: Int = 1;
    b: Int = 2;
    c: Int = 3;
    d: Int = 4;
    e: Int = 5;
    f: Bool = true;
    g: Bool = false;
    h: Int? = null;
    i: Bool? = null;
    j: Int = 10;
    k: Int = 11;
    l: Int = 12;
    init() {
        self.h = 42;
        self.i = true;
    }
    receive() {
        let _ = self.a + self.b + self.c + self.d + self.e + self.j + self.k + self.l;
    }
}