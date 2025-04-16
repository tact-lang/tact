contract ManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Slice?;
    e: Address?;
    f: Cell?;

    init() {
        self.a=null; self.b=null; self.c=null; self.d=null; self.e=null; self.f=null;
    }
}