contract Test15 {
    a: Bool?;
    b: Bool?;
    c: Int?;
    d: Int?;
    e: Address?;
    f: Address?;
    init() {
        self.a=null; self.b=true;
        self.c=1; self.d=null;
        self.e=myAddress(); self.f=null;
    }
}