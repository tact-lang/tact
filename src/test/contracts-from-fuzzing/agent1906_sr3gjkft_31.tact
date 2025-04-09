// A contract with a huge amount of optional bool fields
contract ManyOptionalBools {
    a: Bool?;
    b: Bool?;
    c: Bool?;
    d: Bool?;
    e: Bool?;
    f: Bool?;
    g: Bool?;
    h: Bool?;
    i: Bool?;
    j: Bool?;

    init() {
        self.a=null; self.b=true; self.c=null; self.d=false; self.e=null;
        self.f=true; self.g=false; self.h=null; self.i=true; self.j=false;
    }
}
