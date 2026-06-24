contract ManyOpts {
    a: Int?;            
    b: String? = null;
    c: Bool?;
    d: Cell? = null;
    e: Slice?;
    f: Builder? = null;

    init() {
        self.a = null;
        self.c = null;
        self.e = null;
    }
}
