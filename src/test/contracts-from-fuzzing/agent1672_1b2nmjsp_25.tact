// Fuzz with many bool fields for compact bits usage
contract TestContract {
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
        self.a=true; self.b=false; self.c=true; self.d=false; self.e=true;
        self.f=true; self.g=false; self.h=true; self.i=true; self.j=false;
    }
}