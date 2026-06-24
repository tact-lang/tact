contract LargeMixed {
    a: Int; b: Int?;
    c: Bool; d: Bool?;
    e: String; f: String?;
    g: Address; h: Address?;
    i: Int; j: Int?;
    k: Bool; l: Bool?;
    m: String; n: String?;
    o: Address; p: Address?;

    init() {
        self.a=1; self.b=2;
        self.c=true; self.d=false;
        self.e="e"; self.f="f";
        self.g=myAddress(); self.h=null;
        self.i=3; self.j=4;
        self.k=false; self.l=true;
        self.m="m"; self.n=null;
        self.o=myAddress(); self.p=myAddress();
    }
}