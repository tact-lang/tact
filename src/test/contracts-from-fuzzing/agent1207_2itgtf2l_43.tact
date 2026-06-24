contract DefaultsAndOpts {
    a: Int? = null;
    b: Bool? = null;
    c: Address? = null;
    d: String? = null;
    e: Cell? = null;
    f: Slice? = null;
    g: Int = 42;
    h: Bool = true;
    i: String = "fuzz";

    init() {
        self.a=null; self.b=null; self.c=null; self.d=null; self.e=null; self.f=null; self.g=1; self.h=false; self.i="test";
    }
}