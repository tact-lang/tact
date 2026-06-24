contract LargeMix {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Address;
    h: Address?;
    init() {
        self.a=1; self.b=true; self.c="str";
        self.d=2; self.e=null; self.f="opt";
        self.g=myAddress(); self.h=null;
    }
}