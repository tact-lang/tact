contract MixedFields {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
    g: Address;
    h: Cell;
    i: Slice;

    init() {
        self.a=1; self.b=null; self.c=true; self.d=false; self.e="hi"; self.f=null; self.g=myAddress(); self.h=emptyCell(); self.i=emptyCell().asSlice();
    }
}