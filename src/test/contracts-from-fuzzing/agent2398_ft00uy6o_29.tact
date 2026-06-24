contract MixedTypes {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
    g: Address;
    h: Address?;

    init() {
        self.a=1;
        self.b=null;
        self.c=true;
        self.d=false;
        self.e="abc";
        self.f=null;
        self.g=myAddress();
        self.h=null;
    }
}