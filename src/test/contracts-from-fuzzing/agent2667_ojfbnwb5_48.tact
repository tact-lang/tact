contract ManyBoolFields {
    a: Bool;
    b: Bool;
    c: Bool;
    d: Bool;
    e: Bool;
    f: Bool;

    init() {
        self.a=true; self.b=false; self.c=true;
        self.d=false; self.e=true; self.f=false;
    }

    receive() {
        self.a=false; self.b=true; self.c=false;
        self.d=true; self.e=false; self.f=true;
    }
}