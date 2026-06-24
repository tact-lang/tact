contract LotsOptTypes {
    i: Int?;
    b: Bool?;
    s: String?;
    c: Cell?;
    sl: Slice?;
    bu: Builder?;
    a: Address?;

    init() {
        self.i=null; self.b=null; self.s=null; self.c=null;
        self.sl=null; self.bu=null; self.a=null;
    }
}