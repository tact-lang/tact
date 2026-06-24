contract TestContract {
    a: Int = 1;
    b: Bool = true;
    c: String = "abc";
    d: Int? = null;
    e: Bool? = null;
    f: String? = null;
    g: Int = 2;
    h: Bool = false;
    i: String = "xyz";
    j: Int? = 3;
    k: Bool? = true;
    l: String? = "sss";

    init() {
        self.a=10; self.b=false; self.c="c";
        self.d=20; self.e=true; self.f="f";
        self.g=30; self.h=true; self.i="i";
        self.j=40; self.k=false; self.l="l";
    }
}