contract ManyMixedOptionals {
    i: Int?;
    b: Bool?;
    s: String?;
    a: Address?;
    sl: Slice?;

    init() {
        self.i=null; self.b=null; self.s=null; self.a=null; self.sl=null;
    }
}