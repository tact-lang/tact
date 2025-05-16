contract TestContract {
    a: Int = 0;
    b: Int? = null;
    c: Bool = false;
    d: Bool? = null;
    e: Int = 1;
    f: Int? = null;
    g: Bool = true;
    h: Bool? = null;
    i: Int = 2;
    j: Int? = null;
    k: Bool = false;
    l: Bool? = null;
    m: Int = 3;
    n: Int? = null;
    o: Bool = true;
    p: Bool? = null;

    init() {
        self.a=10; self.b=null; self.c=true; self.d=null;
        self.e=11; self.f=null; self.g=false; self.h=null;
        self.i=12; self.j=null; self.k=true; self.l=null;
        self.m=13; self.n=null; self.o=false; self.p=null;
    }

    receive() { let _ = self.a+self.e+self.i+self.m; }
}