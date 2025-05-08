contract ManyBoolNoDefaults {
    a: Bool;
    b: Bool;
    c: Bool;
    d: Bool;
    e: Bool;
    f: Bool;
    g: Bool;
    h: Bool;
    i: Bool;
    j: Bool;

    init() {
        self.a=false; self.b=true; self.c=false; self.d=true; self.e=false;
        self.f=true; self.g=false; self.h=true; self.i=false; self.j=true;
    }

    receive() {
        let _ = self.b && self.d && self.f && self.h && self.j;
    }
}