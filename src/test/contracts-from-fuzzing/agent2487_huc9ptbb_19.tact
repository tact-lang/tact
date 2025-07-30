contract WithManyFields {
    a: Int;
    b: Bool?;
    c: String;
    d: String?;
    e: Bool;
    f: Int?;
    g: String;
    h: Bool?;
    i: Int;
    j: String?;

    init() {
        self.a=1; self.b=null; self.c="c"; self.d=null; self.e=true;
        self.f = null; self.g="g"; self.h = null; self.i=9; self.j=null;
    }
}