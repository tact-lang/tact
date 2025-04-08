contract MixedFields {
    a: Int;
    b: Bool;
    c: Address?;
    d: Int?;
    e: Bool?;
    f: Slice;

    init() {
        self.a=1; self.b=false; self.c=null; self.d=null; self.e=null; self.f=emptyCell().asSlice();
    }
}
