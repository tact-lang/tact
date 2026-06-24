contract ManyStateVars {
    a: Int;
    b: Int;
    c: Bool;
    d: String;
    e: Bool?;
    f: String?;
    g: Int;
    h: Int;
    init() {
        self.a=1; self.b=2; self.c=true; self.d="x";
        self.e=null; self.f="y"; self.g=3; self.h=4;
    }
}