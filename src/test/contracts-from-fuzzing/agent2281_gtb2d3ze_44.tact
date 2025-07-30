contract FieldOrdering {
    a: Int as uint8;
    b: Int;
    c: Int? as uint8;
    d: Int?;
    e: String;
    f: String?;
    g: Bool;
    h: Bool?;

    init() {
        self.a=1; self.b=2; self.c=null; self.d=null; self.e="e";
        self.f=null; self.g=true; self.h=null;
    }
}