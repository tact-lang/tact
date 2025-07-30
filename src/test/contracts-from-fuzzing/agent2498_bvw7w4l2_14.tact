// Large contract with many primitive and optional fields
contract LargeTest {
    a: Int = 1;
    b: Int? = null;
    c: String = "c";
    d: String? = null;
    e: Bool = true;
    f: Bool? = null;
    g: Int = 2;
    h: Int? = null;
    i: String = "i";
    j: String? = null;
    k: Bool = false;
    l: Bool? = null;

    init() {
        self.a = 123;
        self.b = 456;
        self.c = "abc";
        self.d = "zzz";
        self.e = false;
        self.f = true;
        self.g = 789;
        self.h = null;
        self.i = "hi";
        self.j = null;
        self.k = true;
        self.l = false;
    }
}