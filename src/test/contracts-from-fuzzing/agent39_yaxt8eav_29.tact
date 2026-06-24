contract LargeContract {
    foo: Int;
    bar: Bool;
    baz: String;
    qux: Int?;
    quux: Bool?;
    corge: String?;
    grault: Int;
    garply: Bool;
    waldo: String;
    fred: Int?;
    plugh: Bool?;
    xyzzy: String?;
    thud: Int;

    init() {
        self.foo = 1;
        self.bar = false;
        self.baz = "a";
        self.qux = null;
        self.quux = null;
        self.corge = null;
        self.grault = 2;
        self.garply = true;
        self.waldo = "b";
        self.fred = null;
        self.plugh = null;
        self.xyzzy = null;
        self.thud = 3;
    }
}