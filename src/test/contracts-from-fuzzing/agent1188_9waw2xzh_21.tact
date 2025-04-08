contract OnlyOptionals {
    a: Int?;
    b: Int?;
    c: Bool?;
    d: Address?;
    e: Cell?;
    f: Slice?;
    g: String?;

    init() {
        self.a=null; self.b=null; self.c=null; self.d=null; self.e=null; self.f=null; self.g=null;
    }
}