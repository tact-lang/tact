contract NameClash {
    foo: Int = 1;
    Foo: Int = 2;
    fOo: Int = 3;
    foO: Int = 4;

    init() {
        self.foo = 10;
        self.Foo = 20;
        self.fOo = 30;
        self.foO = 40;
    }

    receive() {}
}