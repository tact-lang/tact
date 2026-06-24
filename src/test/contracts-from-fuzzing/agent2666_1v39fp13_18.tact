contract ManyPrimitives {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Int?;
    g: Bool?;
    h: String?;
    i: Address?;
    j: Cell?;

    init() {
        self.a=1; self.b=true; self.c="hi"; self.d=myAddress(); self.e=emptyCell();
        self.f=null; self.g=null; self.h=null; self.i=null; self.j=null;
    }
}