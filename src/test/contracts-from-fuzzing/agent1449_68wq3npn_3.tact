contract TestContract {
    foo: Int = 1;
    bar: Bool = true;
    corge: String = "hello";
    grault: Int? = null;
    garply: Address? = null;
    waldo: Cell? = null;
    fred: Bool? = null;
    plugh: String? = null;

    init() {
        self.foo = 123;
        self.bar = false;
        self.corge = "world";
        self.grault = 321;
        self.garply = myAddress();
        self.waldo = emptyCell();
        self.fred = true;
        self.plugh = "test";
    }
}
