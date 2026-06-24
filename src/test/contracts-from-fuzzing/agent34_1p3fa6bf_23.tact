contract Test22 {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Int;
    f: Bool;
    g: String;
    h: Address;
    i: Int;
    j: Bool;
    k: String;
    l: Address;
    m: Int;
    n: Bool;
    o: String;

    init() {
        self.a=1;self.b=true;self.c="c";self.d=myAddress();
        self.e=2;self.f=false;self.g="g";self.h=myAddress();
        self.i=3;self.j=true;self.k="k";self.l=myAddress();
        self.m=4;self.n=false;self.o="o";
    }
}