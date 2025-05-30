// test mix of longs, ints, bools, options
contract MixedLaidOut {
    a: Int;
    b: String;
    c: Bool;
    d: Int?;
    e: String?;
    f: Bool?;
    g: Int;
    h: String;
    i: Bool;
    j: Int?;
    k: String?;
    l: Bool?;

    init() {
        self.a=1; self.b="b"; self.c=true; self.d=null; self.e=null;
        self.f=null; self.g=2; self.h="h"; self.i=false; self.j=null; 
        self.k=null; self.l=null;
    }
}