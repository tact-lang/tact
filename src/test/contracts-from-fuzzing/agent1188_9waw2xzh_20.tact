struct Flat {
    a: Int;
    b: Bool;
}

contract FlatDirectFields {
    f1: Int;
    f2: Bool;
    f3: Int?;
    f4: Cell;
    f5: Address;
    f6: Slice;
    f7: String;

    nested: Flat;

    init() {
        self.f1=1; self.f2=true; self.f3=null; self.f4=emptyCell(); self.f5=myAddress(); self.f6=emptyCell().asSlice(); self.f7="hi";
        self.nested = Flat{a:0, b:false};
    }
}