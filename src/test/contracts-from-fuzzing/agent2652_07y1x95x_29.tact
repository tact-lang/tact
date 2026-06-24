struct AllPrims {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    sl: Slice;
    a: Address;
}

contract AllPrimitivesFlat {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Cell;
    f5: Slice;
    f6: Address;
    complex: AllPrims;

    init() {
        self.f1=1; self.f2=true; self.f3="X";
        self.f4=emptyCell(); self.f5=emptyCell().asSlice(); self.f6=myAddress();
        self.complex = AllPrims{ i:2, b:false, s: "Y", c: emptyCell(), sl: emptyCell().asSlice(), a: myAddress() };
    }
}