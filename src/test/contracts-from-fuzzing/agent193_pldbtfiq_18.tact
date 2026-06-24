contract ManyTypes {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String;
    g: Int;
    h: Bool;

    init() {
        self.a=1; self.b=true; self.c="a"; self.d=null; self.e=false;
        self.f="b"; self.g=42; self.h=false;
    }
}