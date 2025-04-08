struct S {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
}

contract ManyPrimitives {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Address;
    f5: Cell;
    f6: Slice;
    s: S;

    init() {
        self.f1=1; self.f2=true; self.f3=""; self.f4=myAddress();
        self.f5=emptyCell(); self.f6=emptyCell().asSlice();
        self.s=S{a:2,b:false,c:"hi",d:myAddress(),e:emptyCell(),f:emptyCell().asSlice()};
    }
}