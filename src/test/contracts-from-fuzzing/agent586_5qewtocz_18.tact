contract ManyPrimitives {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Int;
    h: Bool;
    i: String;

    init() {
        self.a=1; self.b=true; self.c="x";
        self.d=null; self.e=null; self.f=null;
        self.g=2; self.h=false; self.i="y";
    }
    receive(){ self.a = self.a + 1; }
}