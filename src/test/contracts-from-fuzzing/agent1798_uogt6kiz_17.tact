contract OptionalChain {
    a: Int?;
    b: String?;
    c: Address?;
    d: Cell?;
    e: Builder?;
    f: Slice?;

    init() {
        self.a=null; self.b=null; self.c=null; self.d=null; self.e=null; self.f=null;
    }
}