// contract with many fields
contract ManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Int?;
    f: String?;
    g: Bool?;
    h: Address?;
    i: Int;
    j: Bool;
    k: String;
    l: Address;

    init() {
        self.a=1; self.b=true; self.c="x"; self.d=myAddress();
        self.e=null; self.f=null; self.g=null; self.h=null;
        self.i=2; self.j=false; self.k="y"; self.l=myAddress();
    }
}
