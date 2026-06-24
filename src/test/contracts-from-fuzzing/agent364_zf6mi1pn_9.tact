struct S {
    i: Int;
    b: Bool;
    s: String;
    a: Address;
    c: Cell;
    sl: Slice;
    o: Int?;
}

contract DirectFields {
    i: Int;
    b: Bool;
    s: String;
    a: Address;
    c: Cell;
    sl: Slice;
    o: Int?;
    nested: S;

    init() {
        self.i = 1;
        self.b = true;
        self.s = "s";
        self.a = myAddress();
        self.c = emptyCell();
        self.sl = emptyCell().asSlice();
        self.o = null;
        self.nested = S{ i:2, b:false, s:"t", a:myAddress(), c:emptyCell(), sl:emptyCell().asSlice(), o:null };
    }
}