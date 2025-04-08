// contract using all primitives and all optional primitives as fields
contract AllOptionVariants {
    i: Int;
    io: Int?;
    b: Bool;
    bo: Bool?;
    s: String;
    so: String?;
    a: Address;
    ao: Address?;
    c: Cell;
    co: Cell?;
    sl: Slice;
    slo: Slice?;

    init() {
        self.i=1; self.io=null;
        self.b=true; self.bo=false;
        self.s="str"; self.so=null;
        self.a=myAddress(); self.ao=null;
        self.c=emptyCell(); self.co=null;
        self.sl=emptyCell().asSlice(); self.slo=null;
    }
}