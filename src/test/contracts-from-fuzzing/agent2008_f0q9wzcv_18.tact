contract LargeFieldList {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Int?;
    f: Bool?;
    g: String?;
    h: Slice?;
    i: Cell?;
    j: Address?;

    init() {
        self.a=1; self.b=true; self.c="abc"; self.d=myAddress();
        self.e=null; self.f=null; self.g=null; self.h=null; self.i=null; self.j=null;
    }
}
