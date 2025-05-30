contract MixedOptionalsPrimitives {
    a: Int?;
    b: Bool;
    c: Address?;
    d: String;
    e: Bool?;
    f: String?;
    g: Address;
    h: Int;
    init() {
        self.a=null; self.b=true; self.c=null; self.d="d";
        self.e=null; self.f=null; self.g=myAddress(); self.h=10;
    }
}
