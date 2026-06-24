contract OrderedMixed {
    a: Int;
    b: Int? = null;
    c: Bool;
    d: Bool?;
    e: Address;
    f: Address?;
    g: String;
    h: String?;

    init() {
        self.a=1; self.b=2; self.c=true; self.d=null; 
        self.e=myAddress(); self.f=null; self.g = "hi"; self.h = null;
    }
}