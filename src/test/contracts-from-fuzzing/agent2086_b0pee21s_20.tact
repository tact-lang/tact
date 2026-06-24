contract MixedOptional {
    a: Int;
    b: Int?;
    c: String;
    d: String?;
    e: Address;
    f: Address?;
    g: Bool;
    h: Bool?;

    init() {
        self.a=1; self.b=null; self.c="x"; self.d=null;
        self.e=myAddress(); self.f=null;
        self.g=true; self.h=null;
    }
}