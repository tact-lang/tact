contract MixedTypesOrdering {
    a: Int;
    b: Bool;
    c: Slice;
    d: Int?;
    e: Bool?;
    f: Address?;

    init() {
        self.a=1; self.b=true; self.c=emptyCell().asSlice();
        self.d=null; self.e=true; self.f=null;
    }
}
