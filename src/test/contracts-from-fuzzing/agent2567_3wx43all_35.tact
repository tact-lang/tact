contract ManyOptionals {
    a: Int?;
    b: Int?;
    c: Int?;
    d: String?;
    e: String?;
    f: String?;
    g: Bool?;
    h: Bool?;
    i: Bool?;

    init() {
        self.a=1; self.b=null; self.c=3;
        self.d="x"; self.e=null; self.f="y";
        self.g=true; self.h=null; self.i=false;
    }
}